;-------------------------------------------------------------------------------
; mapped memory
;-------------------------------------------------------------------------------
; 0x0002 - 0x00fe: page zero
; 0x0400 - 0x07ff: default screen
; 0x1000 - 0x17ff: default character set
; 0x3C00 - 0x3fff: double buffer screen

; for more see: https://sta.c64.org/cbm64mem.html

;-------------------------------------------------------------------------------
; constants
;-------------------------------------------------------------------------------
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
DELAY           = 16        ; scroll delay
TILE_MAP_WIDTH  = 256       ; number of horizontal tiles
BORDER_COLOR    = 14        ; light blue
BORDER_RENDER   = 0         ; black
BORDER_SWAP     = 5         ; green
BORDER_VBLANK   = 13        ; light green

;-------------------------------------------------------------------------------
; zero page variables
;-------------------------------------------------------------------------------
DELAY1          = $fe       ; delay outer loop
TILE_MAP_X      = $fd       ; tile map x offset in characters
TILE_MAP_X_FINE = $fc       ; fine scroll of screen between 0 and 7
SCREEN_ACTIVE   = $fb       ; active screen (0 or 1)
SCREEN_SWAP_REQ = $fa       ; 1 when swap screen is requested, 0 when done
VBLANK_DONE     = $f9       ; 1 when raster irq triggers

;-------------------------------------------------------------------------------
.export start
start:
;-------------------------------------------------------------------------------
    sei                     ; disable interrupts

    ;
    ; setup for first render
    ;

    lda #7                  ; start at rightmost offset
    sta TILE_MAP_X_FINE     ; store
    lda #0                  ; 0 
    sta TILE_MAP_X          ; start at leftmost map offset
    sta SCREEN_ACTIVE       ; active screen to 0
    sta SCREEN_SWAP_REQ     ; swap screen request to 0
    sta VBLANK_DONE         ; vblank not done

    ;
    ; setup interrupt
    ;

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

;-------------------------------------------------------------------------------
render_tile_map:
    lda #BORDER_RENDER
    sta VIC_BORDER

    ldx TILE_MAP_X
    ldy #0

    ; jump to unrolled loop for current screen
    lda SCREEN_ACTIVE
    beq @screen_0
    jmp @screen_1

@screen_0:
    ; unroll loop and use cheaper instructions to render a column to SCREEN_0
    lda tile_map+TILE_MAP_WIDTH*0,x
    sta SCREEN_0+  SCREEN_WIDTH*0,y
    lda tile_map+TILE_MAP_WIDTH*1,x
    sta SCREEN_0+  SCREEN_WIDTH*1,y
    lda tile_map+TILE_MAP_WIDTH*2,x
    sta SCREEN_0+  SCREEN_WIDTH*2,y
    lda tile_map+TILE_MAP_WIDTH*3,x
    sta SCREEN_0+  SCREEN_WIDTH*3,y
    lda tile_map+TILE_MAP_WIDTH*4,x
    sta SCREEN_0+  SCREEN_WIDTH*4,y
    lda tile_map+TILE_MAP_WIDTH*5,x
    sta SCREEN_0+  SCREEN_WIDTH*5,y
    lda tile_map+TILE_MAP_WIDTH*6,x
    sta SCREEN_0+  SCREEN_WIDTH*6,y
    lda tile_map+TILE_MAP_WIDTH*7,x
    sta SCREEN_0+  SCREEN_WIDTH*7,y
    lda tile_map+TILE_MAP_WIDTH*8,x
    sta SCREEN_0+  SCREEN_WIDTH*8,y
    lda tile_map+TILE_MAP_WIDTH*9,x
    sta SCREEN_0+  SCREEN_WIDTH*9,y
    lda tile_map+TILE_MAP_WIDTH*10,x
    sta SCREEN_0+  SCREEN_WIDTH*10,y
    lda tile_map+TILE_MAP_WIDTH*11,x
    sta SCREEN_0+  SCREEN_WIDTH*11,y
    lda tile_map+TILE_MAP_WIDTH*12,x
    sta SCREEN_0+  SCREEN_WIDTH*12,y
    lda tile_map+TILE_MAP_WIDTH*13,x
    sta SCREEN_0+  SCREEN_WIDTH*13,y
    lda tile_map+TILE_MAP_WIDTH*14,x
    sta SCREEN_0+  SCREEN_WIDTH*14,y
    lda tile_map+TILE_MAP_WIDTH*15,x
    sta SCREEN_0+  SCREEN_WIDTH*15,y
    lda tile_map+TILE_MAP_WIDTH*16,x
    sta SCREEN_0+  SCREEN_WIDTH*16,y
    lda tile_map+TILE_MAP_WIDTH*17,x
    sta SCREEN_0+  SCREEN_WIDTH*17,y
    lda tile_map+TILE_MAP_WIDTH*18,x
    sta SCREEN_0+  SCREEN_WIDTH*18,y
    lda tile_map+TILE_MAP_WIDTH*19,x
    sta SCREEN_0+  SCREEN_WIDTH*19,y
    lda tile_map+TILE_MAP_WIDTH*20,x
    sta SCREEN_0+  SCREEN_WIDTH*20,y
    lda tile_map+TILE_MAP_WIDTH*21,x
    sta SCREEN_0+  SCREEN_WIDTH*21,y
    lda tile_map+TILE_MAP_WIDTH*22,x
    sta SCREEN_0+  SCREEN_WIDTH*22,y
    lda tile_map+TILE_MAP_WIDTH*23,x
    sta SCREEN_0+  SCREEN_WIDTH*23,y
    lda tile_map+TILE_MAP_WIDTH*24,x
    sta SCREEN_0+  SCREEN_WIDTH*24,y
    inx
    iny
    cpy #SCREEN_WIDTH
    beq @jmp_to_done
    jmp @screen_0
@jmp_to_done:
    jmp @done 

@screen_1:
    ; unroll loop and use cheaper instructions to render a column to SCREEN_1
    lda tile_map+TILE_MAP_WIDTH*0,x
    sta SCREEN_1+  SCREEN_WIDTH*0,y
    lda tile_map+TILE_MAP_WIDTH*1,x
    sta SCREEN_1+  SCREEN_WIDTH*1,y
    lda tile_map+TILE_MAP_WIDTH*2,x
    sta SCREEN_1+  SCREEN_WIDTH*2,y
    lda tile_map+TILE_MAP_WIDTH*3,x
    sta SCREEN_1+  SCREEN_WIDTH*3,y
    lda tile_map+TILE_MAP_WIDTH*4,x
    sta SCREEN_1+  SCREEN_WIDTH*4,y
    lda tile_map+TILE_MAP_WIDTH*5,x
    sta SCREEN_1+  SCREEN_WIDTH*5,y
    lda tile_map+TILE_MAP_WIDTH*6,x
    sta SCREEN_1+  SCREEN_WIDTH*6,y
    lda tile_map+TILE_MAP_WIDTH*7,x
    sta SCREEN_1+  SCREEN_WIDTH*7,y
    lda tile_map+TILE_MAP_WIDTH*8,x
    sta SCREEN_1+  SCREEN_WIDTH*8,y
    lda tile_map+TILE_MAP_WIDTH*9,x
    sta SCREEN_1+  SCREEN_WIDTH*9,y
    lda tile_map+TILE_MAP_WIDTH*10,x
    sta SCREEN_1+  SCREEN_WIDTH*10,y
    lda tile_map+TILE_MAP_WIDTH*11,x
    sta SCREEN_1+  SCREEN_WIDTH*11,y
    lda tile_map+TILE_MAP_WIDTH*12,x
    sta SCREEN_1+  SCREEN_WIDTH*12,y
    lda tile_map+TILE_MAP_WIDTH*13,x
    sta SCREEN_1+  SCREEN_WIDTH*13,y
    lda tile_map+TILE_MAP_WIDTH*14,x
    sta SCREEN_1+  SCREEN_WIDTH*14,y
    lda tile_map+TILE_MAP_WIDTH*15,x
    sta SCREEN_1+  SCREEN_WIDTH*15,y
    lda tile_map+TILE_MAP_WIDTH*16,x
    sta SCREEN_1+  SCREEN_WIDTH*16,y
    lda tile_map+TILE_MAP_WIDTH*17,x
    sta SCREEN_1+  SCREEN_WIDTH*17,y
    lda tile_map+TILE_MAP_WIDTH*18,x
    sta SCREEN_1+  SCREEN_WIDTH*18,y
    lda tile_map+TILE_MAP_WIDTH*19,x
    sta SCREEN_1+  SCREEN_WIDTH*19,y
    lda tile_map+TILE_MAP_WIDTH*20,x
    sta SCREEN_1+  SCREEN_WIDTH*20,y
    lda tile_map+TILE_MAP_WIDTH*21,x
    sta SCREEN_1+  SCREEN_WIDTH*21,y
    lda tile_map+TILE_MAP_WIDTH*22,x
    sta SCREEN_1+  SCREEN_WIDTH*22,y
    lda tile_map+TILE_MAP_WIDTH*23,x
    sta SCREEN_1+  SCREEN_WIDTH*23,y
    lda tile_map+TILE_MAP_WIDTH*24,x
    sta SCREEN_1+  SCREEN_WIDTH*24,y
    inx
    iny
    cpy #SCREEN_WIDTH
    beq @done
    jmp @screen_1

@done:
    lda #BORDER_COLOR
    sta VIC_BORDER

    inc SCREEN_SWAP_REQ     ; request screen swap at next vblank
    lda #5                  ; make border green while waiting
    sta VIC_BORDER
:   lda SCREEN_SWAP_REQ     ; wait for request done
    bne :-                  ; wait for 0
    lda #14                 ; restore border
    sta VIC_BORDER

scroll_left:
    ; wait for vblank
    lda #BORDER_VBLANK
    sta VIC_BORDER
:   lda VBLANK_DONE         ; wait for 1 
    beq :-
    dec VBLANK_DONE         ; reset flag
    lda #BORDER_COLOR
    sta VIC_BORDER

    ; shift screen by fine scroll or render new screen
    lda TILE_MAP_X_FINE     ; load fine scroll x
    cmp #255                ; has it rolled over?
    bne :+                  ; no, fine scroll
    lda #7                  ; yes, set to maximum right
    sta TILE_MAP_X_FINE     ; store
    inc TILE_MAP_X          ; scroll map left one character
    jmp render_tile_map     ; render screen to next screen
:   sta VIC_CTRL_2          ; store to chip address
    dec TILE_MAP_X_FINE     ; decrease fine scroll by 1

    jmp scroll_left         ; scroll left

;-------------------------------------------------------------------------------
delay:
    ldx #DELAY 
    ldy #0
:   dey
    bne :-
    dex
    bne :- 
    rts
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
irq:
    pha                     ; push accumulator on the stack
    
    lda #1
    sta VBLANK_DONE         ; set vblank done
    
    lda SCREEN_SWAP_REQ     ; check screen swap request flag
    beq @done               ; no request active, continue to done

    ; swap screens
    lda SCREEN_ACTIVE       ; load active screen
    bne @to_screen_1        ; if screen 1 active
@to_screen_0:
    lda #SCREEN_0_D018      ; screen 0 active
    inc SCREEN_ACTIVE
    jmp @swap               ; continue to write to register
@to_screen_1:
    lda #SCREEN_1_D018      ; screen 1 active
    dec SCREEN_ACTIVE
@swap:
    sta VIC_MEM_CTRL        ; write to register
    dec SCREEN_SWAP_REQ     ; clear screen swap request flag
@done:
    asl $d019               ; acknowledge interrupt

    pla                     ; restore accumulator
    rti                     ; interrupt done
;-------------------------------------------------------------------------------

.align $100                 ; make 256 tiles row accessed by the lower byte
tile_map:                   ; the tile map included from resources
    .include "../resources/tile_map.s"
