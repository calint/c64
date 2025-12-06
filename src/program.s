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
TILE_MAP_WIDTH  = 256       ; number of horizontal tiles
BORDER_COLOR    = 14        ; light blue
BORDER_RENDER   = 0         ; black
BORDER_LOOP     = 9         ; brown
IRQ_RASTER_LINE = 250       ; raster interrupt at bottom border

;-------------------------------------------------------------------------------
; zero page variables
;-------------------------------------------------------------------------------
TILE_MAP_X      = $fe       ; tile map x offset in characters
TILE_MAP_X_FINE = $fd       ; fine scroll of screen between 0 and 7
SCREEN_ACTIVE   = $fc       ; active screen (0 or 1)
VBLANK_DONE     = $fb       ; 1 when raster irq triggers

;-------------------------------------------------------------------------------
.export start
start:
;-------------------------------------------------------------------------------
    sei                     ; disable interrupts

    ;
    ; setup first render
    ;

    lda #256-SCREEN_WIDTH   ; place at right most position in tile map
    sta TILE_MAP_X
    lda #0
    sta TILE_MAP_X_FINE     ; start at left most pixel
    sta SCREEN_ACTIVE       ; active screen  0
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
    lda #IRQ_RASTER_LINE    ; raster line (inside vblank)
    sta VIC_RASTER_REG      ; write
 
    lda #$ff                ; acknowledge any pending vic interrupts
    sta VIC_IRQ_REG         ; write

    lda #1                  ; enable raster irq (bit 0 = raster interrupt)
    sta VIC_IRQ_ENABLE      ; write

    cli                     ; enable interrupts

;-------------------------------------------------------------------------------
render_tile_map:
    ; set border color to illustrate duration of render
    lda #BORDER_RENDER
    sta VIC_BORDER

    ; initiate tile map position and screen column
    ldx TILE_MAP_X
    ldy #0

    ; jump to unrolled loop for current screen
    lda SCREEN_ACTIVE
    beq @screen_0
    jmp @screen_1

@screen_0:
    .include "../resources/screen_0.s"
    inx
    iny
    cpy #SCREEN_WIDTH
    beq @jmp_to_done
    jmp @screen_0
@jmp_to_done:
    jmp @done 

@screen_1:
    .include "../resources/screen_1.s"
    inx
    iny
    cpy #SCREEN_WIDTH
    beq @done
    jmp @screen_1

@done:
    ; restore border color
    lda #BORDER_COLOR
    sta VIC_BORDER

    ; wait for vblank
 :  lda VBLANK_DONE
    beq :-
    lsr VBLANK_DONE

    ; swap screens
    lda SCREEN_ACTIVE       ; load active screen
    bne @to_screen_1        ; if screen 1 active activate screen 0
@to_screen_0:
    lda #SCREEN_0_D018      ; activate screen 0
    inc SCREEN_ACTIVE       ; next active screen 1
    jmp @swap               ; continue to write to register
@to_screen_1:
    lda #SCREEN_1_D018      ; activate screen 1
    lsr SCREEN_ACTIVE       ; next active screen 0
@swap:
    sta VIC_MEM_CTRL        ; write to register

    jmp scroll_right

;-------------------------------------------------------------------------------
scroll_left:
    ; shift screen by fine scroll or render new screen
    lda TILE_MAP_X_FINE     ; load fine scroll x
    sta VIC_CTRL_2          ; store to chip address
    dec TILE_MAP_X_FINE     ; decrease fine scroll by 1
    bpl @done               ; if not 0 wait for vblank before next fine scroll
    lda #7                  ; fine scroll is 0, set maximum right shift
    sta TILE_MAP_X_FINE     ; store
    inc TILE_MAP_X          ; scroll map left one character
    jsr loop                ; run game loop
    jmp render_tile_map     ; render tile map to next screen
@done:
    jsr loop                ; run game loop
 
    ; wait for vblank
 :  lda VBLANK_DONE
    beq :-
    lsr VBLANK_DONE

    jmp scroll_left

;-------------------------------------------------------------------------------
scroll_right:
    ; shift screen by fine scroll or render new screen
    lda TILE_MAP_X_FINE     ; load fine scroll x
    sta VIC_CTRL_2          ; store to chip address
    inc TILE_MAP_X_FINE     ; decrease fine scroll by 1
    cmp #7                  ; note: compares with last stored fine pixel scroll
    bne @done               ; if not 7 wait for vblank before next fine scroll
    lda #0                  ; last pixel, set to minimum left for next frame
    sta TILE_MAP_X_FINE     ; store
    dec TILE_MAP_X          ; scroll map right one character
    jsr loop                ; run game loop
    jmp render_tile_map     ; render tile map to next screen
@done:
    jsr loop                ; run game loop
 
    ; wait for vblank
 :  lda VBLANK_DONE
    beq :-
    lsr VBLANK_DONE

    jmp scroll_right

;-------------------------------------------------------------------------------
loop:
    lda #BORDER_LOOP
    sta VIC_BORDER
    ldy #12
    ldx #0
:   dex
    bne :-
    dey
    bne :-
    lda #BORDER_COLOR
    sta VIC_BORDER
    ; total: 15,423 cycles
    ; time: at 1.023 mhz (ntsc) or 0.985 mhz (pal):
    ; ntsc: ~15.08 ms
    ; pal: ~15.65 ms
    rts

;-------------------------------------------------------------------------------
irq:
    pha                     ; push accumulator on the stack

    lda #1                  ; set vblank done
    sta VBLANK_DONE         ; store
    asl $d019               ; acknowledge interrupt

    pla                     ; restore accumulator
    rti                     ; interrupt done
;-------------------------------------------------------------------------------

.align $100                 ; make 256 tiles row accessed by the lower byte
tile_map:                   ; the tile map included from resources
    .include "../resources/tile_map.s"
