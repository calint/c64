; mapped memory:
; 0x0000 - 0x00ff: page zero
; 0x0400 - 0x07ff: default screen
; 0x1000 - 0x17ff: default character set
; 0x3C00 - 0x3fff: double buffer screen

; see: https://sta.c64.org/cbm64mem.html

; constants
VIC_CTRL_1      = $d011     ; vic-ii control register 1
VIC_RASTER_REG  = $d012     ; vic-ii raster register
VIC_CTRL_2      = $d016     ; vic-ii screen control register 2
VIC_MEM_CTRL    = $d018     ; vic-ii memory control register
VIC_IRQ_REG     = $d019     ; vic-ii interrupt register
VIC_IRQ_ENABLE  = $d01a     ; vic-ii interrupt enable register
VIC_BORDER      = $d020     ; vic-ii border color register
SCREEN_0        = $0400     ; address of screen 0
SCREEN_0_D018   = %00010100 ; screen at $0400 char map at $1000
SCREEN_1        = $3c00     ; address of screen 1
SCREEN_1_D018   = %11110100 ; screen at $3C00 char map at $1000 
SCREEN_WIDTH    = 40        ; screen width in characters
SCREEN_HEIGHT   = 25        ; screen height in characters
DELAY           = 32        ; scroll delay

; zero page variables
DELAY1               = $fe  ; delay outer loop
DELAY2               = $fd  ; delay inner loop
TILE_MAP_BASE        = $fb  ; address to base of tile map (2 bytes)
TILE_MAP_X           = $fa  ; tile map x offset in characters
TILE_MAP_X_FINE      = $f9  ; fine scroll of screen between 0 and 7
TILE_MAP_ROW         = $f8  ; rendering tile map row number (y coordiante)
TILE_MAP_COLUMN      = $f7  ; rendering tile map column (x coordinate)
SCREEN_PTR           = $f5  ; pointer to screen address (2 bytes)
SCREEN_COLUMN        = $f4  ; rendering screen column
SCREEN_ACTIVE        = $f3  ; active screen (0 or 1)
SCREEN_SWAP_REQ      = $f2  ; 1 when swap screen is requested, 0 when done

.export start
start:
    sei                     ; disable interrupts

    ; initiate for first render
    lda #7                  ; start at rightmost offset
    sta TILE_MAP_X_FINE     ; store
    lda #0                  ; 0 
    sta TILE_MAP_X          ; start at leftmost map offset
    sta SCREEN_ACTIVE       ; active screen to 0
    sta SCREEN_SWAP_REQ     ; swap screen request to 0
    lda #<tile_map          ; load low byte of `tile_map` address
    sta TILE_MAP_BASE       ; store 
    lda #>tile_map          ; load high byte of `tile_map` address
    sta TILE_MAP_BASE+1     ; store

    ; setup interrupt

    ; disable cia interrupts that might interfere
    lda #$7f                ; bit 7 = 0 means "disable" 
    sta $dc0d               ; disable cia 1 interrupts
    sta $dd0d               ; disable cia 2 interrupts
    lda $dc0d               ; acknowledge cia 1 interrupts
    lda $dd0d               ; acknowledge cia 2 interrupts

    ; enable write to $fffe/$ffff (all ram mode)
    lda #$35                ; i/o visible, ram at $a000-$ffff
    sta $01

    ; install irq vector at hardware vector
    lda #<irq               ; hardware irq vector low byte
    sta $fffe               ; store
    lda #>irq               ; hardware irq vector high byte
    sta $ffff               ; store

    ; setup which raster line to generate irq
    lda VIC_CTRL_1          ; ensure 9'th bit of raster = 0
    and #%01111111          ; clear bit 7 of raster
    sta VIC_CTRL_1          ; write
    lda #250                ; raster line 250 (inside vblank)
    sta VIC_RASTER_REG      ; write
 
    lda #$ff                ; acknowledge any pending vic interrupts
    sta VIC_IRQ_REG         ; write

    lda #1                  ; enable raster irq (bit 0 = raster interrupt)
    sta VIC_IRQ_ENABLE      ; write

    cli                     ; enable interrupts

render_tile_map:
wait_for_screen_swap_done:  ; wait until screen swap request is done
    ; lda #2
    ; sta VIC_BORDER
    lda SCREEN_SWAP_REQ     ; load flag
    bne wait_for_screen_swap_done

    ; lda #14
    ; sta VIC_BORDER

    lda SCREEN_ACTIVE       ; set SCREEN_PTR to current screen
    beq activate_screen_2
activate_screen_1:
    lda #<SCREEN_0
    sta SCREEN_PTR
    lda #>SCREEN_0
    sta SCREEN_PTR+1
    dec SCREEN_ACTIVE       ; set next active screen to 0
    jmp screen_activated
activate_screen_2:
    lda #<SCREEN_1
    sta SCREEN_PTR
    lda #>SCREEN_1
    sta SCREEN_PTR+1
    inc SCREEN_ACTIVE       ; set next active screen to 1
screen_activated:
    ; reset current column
    lda #0
    sta SCREEN_COLUMN
 
    ; set offset in tile map
    lda TILE_MAP_X
    sta TILE_MAP_COLUMN

    ; set tile map row to initial value (columns are the low byte 0-255)
    lda #>tile_map
    sta TILE_MAP_BASE+1
 
    ; initialize to number of rows to be rendered
    lda #SCREEN_HEIGHT
    sta TILE_MAP_ROW

row_loop:
    ldy TILE_MAP_COLUMN     ; load next character from tile map
    lda (TILE_MAP_BASE),y   ; offset from base
    ldy SCREEN_COLUMN       ; load column on screen to write the character to
    cpy #SCREEN_WIDTH       ; check if done
    beq end_of_row          ; done, next row or screen done
    sta (SCREEN_PTR),y      ; store on current screen
    inc TILE_MAP_COLUMN     ; next tile map column
    inc SCREEN_COLUMN       ; next screen column
    jmp row_loop            ; next character
end_of_row:
    inc TILE_MAP_BASE+1     ; increase high byte addressing next row
    lda TILE_MAP_X          ; offset by x position in tile map
    sta TILE_MAP_COLUMN     ; store
    lda #0                  ; start at screen column 0
    sta SCREEN_COLUMN       ; store

    ; increase screen pointer by a screen width
    clc
    lda SCREEN_PTR
    adc #SCREEN_WIDTH
    sta SCREEN_PTR
    lda SCREEN_PTR+1
    adc #0
    sta SCREEN_PTR+1

    dec TILE_MAP_ROW        ; decrease number of rows to render
    bne row_loop            ; if not finished then next row

    inc SCREEN_SWAP_REQ     ; request screen swap at next vblank
wait_1:                     ; wait for swap to be done by the `irq`
    lda SCREEN_SWAP_REQ     ; check status of flag
    bne wait_1              ; wait until it is 0

scroll_left:
    lda TILE_MAP_X_FINE     ; load fine scroll x
    cmp #255                ; has it rolled over?
    bne fine_scroll         ; no, fine scroll
    lda #7                  ; yes, set to maximum right
    sta TILE_MAP_X_FINE     ; store
    inc TILE_MAP_X          ; scroll map left one character
    jmp render_tile_map     ; render screen to next screen

fine_scroll:
    sta VIC_CTRL_2          ; store to chip address
    dec TILE_MAP_X_FINE     ; decrease fine scroll by 1
    jsr delay               ; delay
    jmp scroll_left         ; scroll left

;-------------------------------------------------------------------------------
delay:
    lda #DELAY 
    sta DELAY1
    lda #0
    sta DELAY2
delay1:
    dec DELAY1
    bne delay1
    lda #DELAY
    sta DELAY1
    dec DELAY2
    bne delay1
    rts
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
irq:
    pha                     ; push accumulator on the stack

    lda SCREEN_SWAP_REQ     ; check screen swap request flag
    beq irq_done            ; no request active, continue to done

    ; swap screens
    lda SCREEN_ACTIVE       ; load active screen
    bne swap_screen_1       ; if screen 1 active
    lda #SCREEN_0_D018      ; screen 0 active
    jmp swap_screen         ; continue to write to register
swap_screen_1:
    lda #SCREEN_1_D018      ; screen 1 active
swap_screen:
    sta VIC_MEM_CTRL        ; write to register
    dec SCREEN_SWAP_REQ     ; clear screen swap request flag
irq_done:
    asl $d019               ; acknowledge interrupt

    pla                     ; restore accumulator
    rti                     ; interrupt done
;-------------------------------------------------------------------------------

.align $100         ; make 256 tiles row accessed by the lower byte 
tile_map:
    .include "../resources/tile_map.s"
