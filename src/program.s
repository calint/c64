;-------------------------------------------------------------------------------
; mapped memory
;-------------------------------------------------------------------------------
; 0x0002 - 0x00ff: page zero
; 0x0400 - 0x07e7: default screen (screen 0)
; 0x07f8 - 0x07ff: sprites data index to address/64 when screen 0 is active
; 0x0800 - 0x0800; 0 so basic program can run
; 0x0801 - 0x080d: basic stub to jump to $5900
; 0x1000 - 0x17ff: default character set (note: vic-ii chip sees rom data)
; 0x1800 - 0x1fff: alternate character set (note: vic-ii chip sees rom data)
; 0x2000 - 0x27ff: user defined character set 1
; 0x2800 - 0x2fff: user defined character set 2
; 0x3000 - 0x3bff: 48 sprite definition data
; 0x3c00 - 0x3fe7: double buffer screen (screen 1)
; 0x3ff8 - 0x3fff: sprites data index to address/64 when screen 1 is active
; 0x4000 - 0x58ff: tile map
; 0x5900 -       : program

; for more see: linker.cfg, build output and https://sta.c64.org/cbm64mem.html

;-------------------------------------------------------------------------------
; constants
;-------------------------------------------------------------------------------
VIC_SPRITE_0_X  = $d000     ; vic-ii sprite 0 x lower 8 bits
VIC_SPRITE_0_Y  = $d001     ; vic-ii sprite 0 y
VIC_SPRITE_1_X  = $d002     ; vic-ii sprite 1 x lower 8 bits
VIC_SPRITE_1_Y  = $d003     ; vic-ii sprite 1 y
VIC_SPRITE_2_X  = $d004     ; vic-ii sprite 2 x lower 8 bits
VIC_SPRITE_2_Y  = $d005     ; vic-ii sprite 2 y
VIC_SPRITE_3_X  = $d006     ; vic-ii sprite 3 x lower 8 bits
VIC_SPRITE_3_Y  = $d007     ; vic-ii sprite 3 y
VIC_SPRITE_4_X  = $d008     ; vic-ii sprite 4 x lower 8 bits
VIC_SPRITE_4_Y  = $d009     ; vic-ii sprite 4 y
VIC_SPRITE_5_X  = $d00a     ; vic-ii sprite 5 x lower 8 bits
VIC_SPRITE_5_Y  = $d00b     ; vic-ii sprite 5 y
VIC_SPRITE_6_X  = $d00c     ; vic-ii sprite 6 x lower 8 bits
VIC_SPRITE_6_Y  = $d00d     ; vic-ii sprite 6 y
VIC_SPRITE_7_X  = $d00e     ; vic-ii sprite 7 x lower 8 bits
VIC_SPRITE_7_Y  = $d00f     ; vic-ii sprite 7 y
VIC_SPRITES_8X  = $d010     ; vic-ii 8'th bit of x for sprites 0-7
VIC_CTRL_1      = $d011     ; vic-ii control register 1
VIC_RASTER_REG  = $d012     ; vic-ii raster register
VIC_SPRITE_ENBL = $d015     ; vic-ii sprite enable bits
VIC_CTRL_2      = $d016     ; vic-ii screen control register 2
VIC_SPRITE_DBLY = $d017     ; vic-ii double sprites height bits
VIC_MEM_CTRL    = $d018     ; vic-ii memory control register
VIC_IRQ_REG     = $d019     ; vic-ii interrupt register
VIC_IRQ_ENABLE  = $d01a     ; vic-ii interrupt enable register
VIC_SPRITE_DBLX = $d01d     ; vic-ii double sprites width bits
VIC_BORDER      = $d020     ; vic-ii border color register
VIC_SPRITE_COLR = $d027     ; vic-ii 8 sprite colors
VIC_DATA_PORT_A = $dc00     ; joystick 2
VIC_DATA_PORT_B = $dc01     ; joystick 1
SPRITE_IX_OFST  = $03f8     ; sprite data index table offset from screen address
SCREEN_0_D018   = %00011000 ; screen at $0400 char map at $2000
SCREEN_1_D018   = %11111000 ; screen at $3C00 char map at $2000 
SCREEN_WIDTH    = 40        ; screen width in characters
SCREEN_HEIGHT   = 25        ; screen height in characters
TILE_MAP_WIDTH  = 256       ; number of horizontal tiles
BORDER_COLOR    = 14        ; light blue
BORDER_RENDER   = 0         ; black
BORDER_UPDATE   = 7         ; yellow
BORDER_LOOP     = 2         ; red
IRQ_RASTER_LINE = 250       ; raster interrupt at bottom border
JOYSTICK_UP     = 1         ; bit when joystick is up
JOYSTICK_DOWN   = 2         ; bit when joystick is down
JOYSTICK_LEFT   = 4         ; bit when joystick is left
JOYSTICK_RIGHT  = 8         ; bit when joystick is right
JOYSTICK_FIRE   = 16        ; bit when joystick is fire

;-------------------------------------------------------------------------------
; program header
;-------------------------------------------------------------------------------
.org $0000
.segment "HEADER"
header:
.out .sprintf("       header: $%04X", header)
.word $0801                ; prg load address hard-coded

;-------------------------------------------------------------------------------
; zero page
;-------------------------------------------------------------------------------
.org $0002
.segment "ZEROPAGE"
zp:
.out .sprintf("    zero page: $%04X", zp)
camera_x_lo:     .res 1     ; low byte of camera x
camera_x_hi:     .res 1     ; high byte of camera x
tile_map_x:      .res 1     ; tile map x offset in characters
tile_map_x_fine: .res 1     ; fine scroll of screen between 0 and 7
screen_active:   .res 1     ; active screen (0 or 1)
vblank_done:     .res 1     ; 1 when raster irq triggers
tmp1:            .res 1     ; very near temporary
tmp2:            .res 1

;-------------------------------------------------------------------------------
; stack
;-------------------------------------------------------------------------------
.org $0100
.segment "STACK"
stack:
.out .sprintf("        stack: $%04X", stack)
.res 256

;-------------------------------------------------------------------------------
; screen 0
;-------------------------------------------------------------------------------
.org $0400
.segment "SCREEN_0"
screen_0:
.out .sprintf("     screen_0: $%04X", screen_0)
.res 1000

;-------------------------------------------------------------------------------
; basic stub to jump to $5900: 10 sys 22784
;-------------------------------------------------------------------------------
.assert * <= $0801, error, "segment overflows into BASIC"
.org $0801
.segment "BASIC"
basic:
.out .sprintf("        basic: $%04X", basic)
.word $080b                 ; pointer to next basic line
.word 10                    ; line number
.byte $9e                   ; sys token
.byte "22784", 0            ; sys 22784 ($5900 in decimal)
.word 0                     ; end of basic program
.assert * = $80e, error, "segment BASIC has unexpected size"

;-------------------------------------------------------------------------------
; charset 0 (note: vic-ii sees rom mapped memory, cpu sees regular ram)
;-------------------------------------------------------------------------------
.assert * <= $1000, error, "segment overflows into CHARSET_0"
.org $1000
.segment "CHARSET_0"
charset_0:
.out .sprintf("    charset_0: $%04X", charset_0)
    .res $0800

;-------------------------------------------------------------------------------
; charset 1 (note: vic-ii sees rom mapped memory, cpu sees regular ram)
;-------------------------------------------------------------------------------
.assert * <= $1800, error, "segment overflows into CHARSET_1"
.org $1800
.segment "CHARSET_1"
charset_1:
.out .sprintf("    charset_1: $%04X", charset_1)
    .res $0800

;-------------------------------------------------------------------------------
; charset 2 (can be modified)
;-------------------------------------------------------------------------------
.assert * <= $2000, error, "segment overflows into CHARSET_2"
.org $2000
.segment "CHARSET_2"
charset_2:
.out .sprintf("    charset_2: $%04X", charset_2)
    .include "../resources/charset_2.s"

;-------------------------------------------------------------------------------
; charset 4 (can be modified)
;-------------------------------------------------------------------------------
.assert * <= $2800, error, "segment overflows into CHARSET_3"
.org $2800
.segment "CHARSET_3"
charset_3:
.out .sprintf("    charset_3: $%04X", charset_3)
    .incbin "../resources/charset_3.bin"

;-------------------------------------------------------------------------------
; sprites data
;-------------------------------------------------------------------------------
; 0x3c00 - 0x3000 = 3072 / 64 = 48 sprites
.assert * <= $3000, error, "segment overflows into SPRITES_DATA"
.org $3000
.segment "SPRITES_DATA"
sprites_data:
.out .sprintf(" sprites_data: $%04X", sprites_data)
sprite_0_data:
    ; 63 bytes of sprite data (21 rows × 3 bytes)
    .byte %00000000, %00000000, %00000000  ; row 0
    .byte %00000001, %11111000, %00000000  ; row 1
    .byte %00000111, %11111110, %00000000  ; row 2
    .byte %00001111, %11111111, %00000000  ; row 3
    .byte %00011111, %11111111, %10000000  ; row 4
    .byte %00111111, %11111111, %11000000  ; row 5
    .byte %01111111, %11111111, %11100000  ; row 6
    .byte %01111111, %11111111, %11100000  ; row 7
    .byte %11111111, %11111111, %11110000  ; row 8
    .byte %11111111, %11111111, %11110000  ; row 9
    .byte %11111111, %11111111, %11110000  ; row 10
    .byte %11111111, %11111111, %11110000  ; row 11
    .byte %11111111, %11111111, %11110000  ; row 12
    .byte %01111111, %11111111, %11100000  ; row 13
    .byte %01111111, %11111111, %11100000  ; row 14
    .byte %00111111, %11111111, %11000000  ; row 15
    .byte %00011111, %11111111, %10000000  ; row 16
    .byte %00001111, %11111111, %00000000  ; row 17
    .byte %00000111, %11111110, %00000000  ; row 18
    .byte %00000001, %11111000, %00000000  ; row 19
    .byte %00000000, %00000000, %00000000  ; row 20
    .byte 0

;-------------------------------------------------------------------------------
; screen 1
;-------------------------------------------------------------------------------
.assert * <= $3c00, error, "segment overflows into SCREEN_1"
.org $3c00
.segment "SCREEN_1"
screen_1:
.out .sprintf("     screen_1: $%04X", screen_1)
    .res $400

;-------------------------------------------------------------------------------
; tile map
;-------------------------------------------------------------------------------
.assert * <= $4000, error, "segment overflows into TILE_MAP"
.segment "TILE_MAP"
.org $4000
tile_map:                   ; the tile map included from resources
.out .sprintf("     tile_map: $%04X", tile_map)
    .include "../resources/tile_map.s"

;-------------------------------------------------------------------------------
; program
;-------------------------------------------------------------------------------
.assert * <= $5900, error, "segment overflows into CODE"
.org $5900
.segment "CODE"
program:
.out .sprintf("      program: $%04X", program)
    sei                     ; disable interrupts

    ; setup memory mode ram visible at $a000-$bfff and $e000-$ffff
    lda #%00110101          ; see https://sta.c64.org/cbm64mem.html
    sta $01

    ; install interrupt handler
    lda #<irq               ; hardware irq vector low byte
    sta $fffe               ; store
    lda #>irq               ; hardware irq vector high byte
    sta $ffff               ; store

    ; install non-maskable interrupt handler
    lda #<nmi               ;
    sta $fffa               ; NMI vector low byte
    lda #>nmi               ;
    sta $fffb               ; NMI vector high byte

    ; disable cia interrupts that might interfere
    lda #$7f                ; bit 7 = 0 means "disable" 
    sta $dc0d               ; disable cia 1 interrupts
    sta $dd0d               ; disable cia 2 interrupts
    lda $dc0d               ; acknowledge cia 1 interrupts
    lda $dd0d               ; acknowledge cia 2 interrupts

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

    ;
    ; setup first render
    ;

    lda #$ff                ; value to not match camera for render at first pass
    sta tile_map_x
    lda #0
    sta tile_map_x_fine     ; start at left most pixel
    sta camera_x_lo
    sta camera_x_hi
    sta vblank_done         ; vblank not done
    sta screen_active       ; active screen  0
 
    ; lda tile_map_x_fine     ; load fine scroll x
    ; sta VIC_CTRL_2          ; store to chip address
    ;
    ; lda #SCREEN_0_D018      ; activate screen 0
    ; sta VIC_MEM_CTRL        ; write to register

    cli                     ; enable interrupts
    jmp render

;-------------------------------------------------------------------------------
; Flow:
; 1. `render_tile_map`
; 2. `game_loop`
; 3. `update`
; 4. in case screen needs redraw 1 else 2
;
; note: somewhat spaghetti due to the fine scroll vs full redraw cycle
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
render_tile_map:
    ; set border color to illustrate duration of render
    lda #BORDER_RENDER
    sta VIC_BORDER

    ; initiate tile map position and screen column
    ldx tile_map_x
    ldy #0

    ; jump to unrolled loop for current screen
    lda screen_active
    beq @screen_0
    jmp @screen_1

@screen_0:
    ; generated unrolled loop with cheaper absolute indexing
    .include "../resources/screen_0.s"
    inx
    iny
    cpy #SCREEN_WIDTH
    beq @jmp_to_done
    jmp @screen_0
@jmp_to_done:
    jmp @done 

@screen_1:
    ; generated unrolled loop with cheaper absolute indexing
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

 :  lda vblank_done         ; wait for vblank 
    beq :-
    lsr vblank_done

    ; swap screens
    lda screen_active       ; load active screen
    bne @to_screen_1        ; if screen 1 active then activate screen 0
@to_screen_0:
    lda #SCREEN_0_D018      ; activate screen 0
    inc screen_active       ; next active screen 1
    jmp @swap               ; continue to write to register
@to_screen_1:
    lda #SCREEN_1_D018      ; activate screen 1
    lsr screen_active       ; next active screen 0
@swap:
    sta VIC_MEM_CTRL        ; write to register

    ; jump to game loop but skip wait for vblank because render did that prior
    ; to swapping screens
    jmp game_loop_no_vblank

;-------------------------------------------------------------------------------
render:
    lda camera_x_lo         ; camera position low byte
    tay                     ; save for later
    and #%00000111          ; calculate screen shift right
    eor #%00000111          ; invert
    clc                     ; add 1 to correct for 0 being 7
    adc #1                  ;
    and #%00000111          ; select relevant bits
    sta VIC_CTRL_2          ; store to chip address
    lda camera_x_hi         ;
    asl A
    asl A
    asl A
    asl A
    asl A
    sta tmp1
    tya
    lsr A
    lsr A
    lsr A
    ora tmp1
    ; acc now contains new tile map x
    cmp tile_map_x
    beq game_loop
    sta tile_map_x
    jmp render_tile_map

;-------------------------------------------------------------------------------
game_loop:
 :  lda vblank_done         ; wait for vblank 
    beq :-
    lsr vblank_done

game_loop_no_vblank:
    lda #BORDER_LOOP
    sta VIC_BORDER

    ; sprite 0
    lda sprites_state+0
    sta VIC_SPRITE_0_X
    lda sprites_state+1
    sta VIC_SPRITE_0_Y
    lda sprites_state+2
    sta screen_0+SPRITE_IX_OFST+0
    sta screen_1+SPRITE_IX_OFST+0
    lda sprites_state+3
    sta VIC_SPRITE_COLR+0
 
    ; sprite 1
    lda sprites_state+4
    sta VIC_SPRITE_1_X
    lda sprites_state+5
    sta VIC_SPRITE_1_Y
    lda sprites_state+6
    sta screen_0+SPRITE_IX_OFST+1
    sta screen_1+SPRITE_IX_OFST+1
    lda sprites_state+7
    sta VIC_SPRITE_COLR+1
 
    ; sprite 2
    lda sprites_state+8
    sta VIC_SPRITE_2_X
    lda sprites_state+9
    sta VIC_SPRITE_2_Y
    lda sprites_state+10
    sta screen_0+SPRITE_IX_OFST+2
    sta screen_1+SPRITE_IX_OFST+2
    lda sprites_state+11
    sta VIC_SPRITE_COLR+2

    ; sprite 3
    lda sprites_state+12
    sta VIC_SPRITE_3_X
    lda sprites_state+13
    sta VIC_SPRITE_3_Y
    lda sprites_state+14
    sta screen_0+SPRITE_IX_OFST+3
    sta screen_1+SPRITE_IX_OFST+3
    lda sprites_state+15
    sta VIC_SPRITE_COLR+3

    ; sprite 4
    lda sprites_state+16
    sta VIC_SPRITE_4_X
    lda sprites_state+17
    sta VIC_SPRITE_4_Y
    lda sprites_state+18
    sta screen_0+SPRITE_IX_OFST+4
    sta screen_1+SPRITE_IX_OFST+4
    lda sprites_state+19
    sta VIC_SPRITE_COLR+4

    ; sprite 5
    lda sprites_state+20
    sta VIC_SPRITE_5_X
    lda sprites_state+21
    sta VIC_SPRITE_5_Y
    lda sprites_state+22
    sta screen_0+SPRITE_IX_OFST+5
    sta screen_1+SPRITE_IX_OFST+5
    lda sprites_state+23
    sta VIC_SPRITE_COLR+5
 
    ; sprite 6
    lda sprites_state+24
    sta VIC_SPRITE_6_X
    lda sprites_state+25
    sta VIC_SPRITE_6_Y
    lda sprites_state+26
    sta screen_0+SPRITE_IX_OFST+6
    sta screen_1+SPRITE_IX_OFST+6
    lda sprites_state+27
    sta VIC_SPRITE_COLR+6

    ; sprite 7
    lda sprites_state+28
    sta VIC_SPRITE_7_X
    lda sprites_state+29
    sta VIC_SPRITE_7_Y
    lda sprites_state+30
    sta screen_0+SPRITE_IX_OFST+7
    sta screen_1+SPRITE_IX_OFST+7
    lda sprites_state+31
    sta VIC_SPRITE_COLR+7

    ; sprites state
    lda sprites_enable
    sta VIC_SPRITE_ENBL
    lda sprites_double_width
    sta VIC_SPRITE_DBLX
    lda sprites_double_height
    sta VIC_SPRITE_DBLY
    lda sprites_msb_x
    sta VIC_SPRITES_8X

    jsr update

;     ; joystick
;     lda VIC_DATA_PORT_A 
;     and #JOYSTICK_LEFT
;     bne @right
;     sec                 ; set carry for subtraction
;     lda camera_x_lo     ; load low byte
;     sbc #1              ; subtract value (and borrow if needed)
;     sta camera_x_lo     ; store result low byte
;     lda camera_x_hi     ; load high byte
;     sbc #0              ; subtract borrow only (if carry was clear)
;     sta camera_x_hi     ; store result high byte
;     jmp render
; @right:
;     lda VIC_DATA_PORT_A 
;     and #JOYSTICK_RIGHT
;     bne @done
;     clc                 ; clear carry for addition
;     lda camera_x_lo     ; load low byte
;     adc #1              ; add value
;     sta camera_x_lo     ; store result low byte
;     lda camera_x_hi     ; load high byte
;     adc #0              ; add carry only (if overflow from low byte)
;     sta camera_x_hi     ; store result high byte
;     jmp render
; @done:
    jmp render 

;-------------------------------------------------------------------------------
update:
    
    ; placeholder for game loop
    ; total: 15,423 cycles
    ; time: at 1.023 mhz (ntsc) or 0.985 mhz (pal):
    ; ntsc: ~15.08 ms
    ; pal: ~15.65 ms

    lda #BORDER_UPDATE
    sta VIC_BORDER

    ; increase x, y, sprtite 0
    inc sprites_state+0
    inc sprites_state+1

    ; dec x, y, sprtite 0
    dec sprites_state+4
    dec sprites_state+5

    clc
    lda camera_x_lo
    adc #1
    sta camera_x_lo
    lda camera_x_hi
    adc #0
    sta camera_x_hi

    ; sec
    ; lda camera_x_lo
    ; sbc #1
    ; sta camera_x_lo
    ; lda camera_x_hi
    ; sbc #0                  ; subtract the borrow
    ; sta camera_x_hi

    ldy #4
    ldx #0
 :  dex
    bne :-
    dey
    bne :-
  
    lda #BORDER_COLOR
    sta VIC_BORDER

    rts
;-------------------------------------------------------------------------------
irq:
    sei                     ; don't allow nested interrupts
    pha                     ; push accumulator on the stack

    lda VIC_IRQ_REG         ; read interrupt status register
    and #1                  ; check bit 0 (raster interrupt)
    beq @not_raster         ; if not set, not a raster interrupt
    lda #1                  ; set vblank done
    sta vblank_done         ; store

@not_raster:
 
    lda #$ff                ; clear all interrupt flags (bits 1-3)
    sta VIC_IRQ_REG         ; write to register 

    pla                     ; restore accumulator
    rti                     ; interrupt done
;-------------------------------------------------------------------------------
nmi:
    rti
;-------------------------------------------------------------------------------
sprites_state:
    ; x, y, data, color
    .byte  30,  50, sprite_0_data>>6, 1
    .byte  90, 100, sprite_0_data>>6, 2
    .byte 110, 110, sprite_0_data>>6, 3
    .byte 120, 120, sprite_0_data>>6, 4
    .byte 130, 130, sprite_0_data>>6, 5
    .byte 140, 140, sprite_0_data>>6, 6
    .byte 150, 150, sprite_0_data>>6, 7
sprites_msb_x: ; 8'th bit of x-coordinate
    .byte %00000000
sprites_enable:
    .byte %11111111
sprites_double_width:
    .byte %00000001
sprites_double_height:
    .byte %00000001
;-------------------------------------------------------------------------------
.assert * <= $d000, error, "segment overflows into I/O"
