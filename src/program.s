; mapped memory:
; 0x0000 - 0x00ff: page zero
; 0x0400 - 0x07ff: default screen
; 0x1000 - 0x17ff: default character set
; 0x3C00 - 0x3fff: double buffer screen
;
; constants
VIC_CONTROL_X   = $D016     ; vic-ii screen control register 2
VIC_MEM_CTRL    = $D018     ; vic-ii memory control register
SCREEN_ADDRESS  = $0400     ; screen address
SCREEN_WIDTH    = 40        ; screen width in characters
SCREEN_HEIGHT   = 25        ; screen height in characters
DELAY           = 32        ; scroll delay
D018_SCREEN_1   = %00010100 ; screen at $0400 char map at $1000
SCREEN_1        = $0400
D018_SCREEN_2   = %11110100 ; screen at $3C00 char map at $1000 
SCREEN_2        = $3C00

; page 0 variables
SCROLL_X             = $FE       ; fine scroll of screen between 0 and 7
DELAY1               = $FD       ; delay outer loop
DELAY2               = $FC       ; delay inner loop
MAP_OFFSET_X         = $FB       ; map offset in characters
TILE_MAP_BASE        = $F9       ; address to base of tile map (2 bytes)
TILE_MAP_ROW         = $F8       ; tile map rendering row number
SCREEN_PTR           = $F6       ; pointer to screen address (2 bytes)
SCREEN_COLUMN        = $F5       ; current screen column
TILE_MAP_COLUMN      = $F4       ; current tile map column (x coordinate)
SCREEN_ACTIVE        = $F3       ; active screen 0 or 1
SWAP_SCREEN_REQ      = $F2       ; 1 when swap screen is requested, 0 when done

.export start
start:
    sei                     ; disable interrupts

    lda #7                  ; start at rightmost offset
    sta SCROLL_X            ; store
    lda #0                  ; start at leftmost map offset
    sta MAP_OFFSET_X        ; store
    sta SCREEN_ACTIVE
    sta SWAP_SCREEN_REQ
    lda #<tile_map          ; Load low byte of tile_map address
    sta TILE_MAP_BASE       ; Store to ZP location $F9
    lda #>tile_map          ; Load high byte of tile_map address
    sta TILE_MAP_BASE+1     ; Store to ZP location $FA

    ; disable cia interrupts that might interfere
    lda #$7f
    sta $dc0d               ; disable cia 1 interrupts
    sta $dd0d               ; disable cia 2 interrupts
    lda $dc0d               ; acknowledge cia 1 interrupts
    lda $dd0d               ; acknowledge cia 2 interrupts

    ; make sure we can write to $fffe/$ffff (all ram mode)
    lda #$35                ; i/o visible, ram at $a000-$ffff
    sta $01

    ; install irq vector at hardware vector (not kernal)
    lda #<irq
    sta $fffe               ; hardware irq vector low byte
    lda #>irq
    sta $ffff               ; hardware irq vector high byte

    ; set raster line = 250 (inside vblank)
    lda #250
    sta $d012

    ; ensure high bit of raster = 0
    lda $d011
    and #%01111111          ; clear bit 7 of raster
    sta $d011
 
    ; acknowledge any pending vic interrupts
    lda #$ff
    sta $d019
    
    ; enable raster irq (bit 0 = raster interrupt)
    lda #1
    sta $d01a

    cli                     ; enable interrupts

render_tile_map:
wait_for_screen_swap_done:
    lda SWAP_SCREEN_REQ
    bne wait_for_screen_swap_done

    lda SCREEN_ACTIVE
    beq activate_screen_2
activate_screen_1:
    lda #>SCREEN_1
    sta SCREEN_PTR+1
    lda #<SCREEN_1
    sta SCREEN_PTR
    dec SCREEN_ACTIVE
    jmp screen_activated
activate_screen_2:
    lda #>SCREEN_2
    sta SCREEN_PTR+1
    lda #<SCREEN_2
    sta SCREEN_PTR
    inc SCREEN_ACTIVE
screen_activated:
    ; reset current column
    lda #0
    sta SCREEN_COLUMN
 
    ; set offset in tile map
    lda MAP_OFFSET_X
    sta TILE_MAP_COLUMN

    ; set tile map row to initial value
    lda #>tile_map
    sta TILE_MAP_BASE+1
    
    ; initialize to number of rows to be rendered
    lda #SCREEN_HEIGHT
    sta TILE_MAP_ROW

row_loop:
    ldy TILE_MAP_COLUMN
    lda (TILE_MAP_BASE),y
    ldy SCREEN_COLUMN
    cpy #SCREEN_WIDTH
    beq end_of_row
    sta (SCREEN_PTR),y
    inc TILE_MAP_COLUMN
    inc SCREEN_COLUMN
    jmp row_loop
end_of_row:
    inc TILE_MAP_BASE+1
    lda MAP_OFFSET_X
    sta TILE_MAP_COLUMN
    lda #0
    sta SCREEN_COLUMN
    ; increase screen pointer by a screen width
    clc
    lda SCREEN_PTR
    adc #SCREEN_WIDTH
    sta SCREEN_PTR
    lda SCREEN_PTR+1
    adc #0
    sta SCREEN_PTR+1
    ; when screen is rendered scroll left
    dec TILE_MAP_ROW
    bne row_loop

    inc SWAP_SCREEN_REQ
wait_for_screen_swap_done_2:
    lda SWAP_SCREEN_REQ
    bne wait_for_screen_swap_done_2

scroll_left:
    lda SCROLL_X            ; load fine scroll x
    cmp #255                ; has it rolled over?
    bne fine_scroll         ; no, fine scroll
    lda #7                  ; yes, set to maximum right
    sta SCROLL_X
    inc MAP_OFFSET_X        ; scroll map left one character
    jmp render_tile_map

fine_scroll:
    sta VIC_CONTROL_X       ; store to chip address
    dec SCROLL_X            ; decrease fine scroll by 1
    jsr delay
    jmp scroll_left         ; scroll left

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

irq:
    pha

    lda SWAP_SCREEN_REQ
    beq irq_done
    ; swap screens
    lda SCREEN_ACTIVE
    bne swap_screen_2
    lda #D018_SCREEN_1
    jmp swap_screen
swap_screen_2:
    lda #D018_SCREEN_2
swap_screen:
    sta VIC_MEM_CTRL
    dec SWAP_SCREEN_REQ
irq_done:
    asl $d019

    pla
    rti

.align $100         ; make 256 tiles row accessed by the lower byte 
tile_map:
    .include "../resources/tile_map.s"
