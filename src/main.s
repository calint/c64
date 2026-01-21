;-------------------------------------------------------------------------------
; mapped memory
;-------------------------------------------------------------------------------
; $0000        : processor port data direction register
; $0001        : processor port
; $0002 - $00ff: zero page
; $0400 - $07e7: default screen
; $07f8 - $07ff: sprites data index to address / 64
; $0800        : byte must be 0 so BASIC stub at $0801 runs
; $0801 - $080d: basic stub to jump to $5900
; $1000 - $17ff: default character set (vic-ii chip sees rom data)
; $1800 - $1fff: alternate character set (vic-ii chip sees rom data)
; $2000 - $27ff: user defined character set 1
; $2800 - $2fff: user defined character set 2
; $3000 - $3fff: 64 sprites data
; $4000 - $58ff: tile map
; $5900 - $cfff: program
; $d000 - $d3ff: vic-ii video display
; $d400 - $d7ff: sid audio
; $d800 - $dbff: color ram (4 bit nibbles)
; $dc00 - $dcff: cia #1: keyboard, joystick, mouse, datasette, irq control
; $dd00 - $ddff: cia #2: serial bus, rs232, nmi control
; $de00 - $deff: i/o area #1
; $df00 - $dfff: i/o area #2
; $e000 - $fff9: free
; $fffa - $ffff: hardware vectors

; for more see: linker.cfg, build output and https://sta.c64.org/cbm64mem.html

;-------------------------------------------------------------------------------
; constants
;-------------------------------------------------------------------------------
VIC_SPRITE_X    = $d000      ; vic-ii sprite 0 x low 8 bits
VIC_SPRITE_Y    = $d001      ; vic-ii sprite 0 y
VIC_SPRITES_8X  = $d010      ; vic-ii 9th x bits for sprites 0-7
VIC_CTRL_1      = $d011      ; vic-ii screen control register 1
VIC_RASTER_REG  = $d012      ; vic-ii raster register
VIC_SPRITE_ENBL = $d015      ; vic-ii sprite enable bits
VIC_CTRL_2      = $d016      ; vic-ii screen control register 2
VIC_SPRITE_DBLY = $d017      ; vic-ii sprite double-height bits
VIC_MEM_CTRL    = $d018      ; vic-ii memory control register
VIC_IRQ_REG     = $d019      ; vic-ii interrupt register
VIC_BG_COLOR    = $d021      ; vic-ii background color register
VIC_IRQ_ENABLE  = $d01a      ; vic-ii interrupt enable register
VIC_SPRITE_DBLX = $d01d      ; vic-ii sprite double-width bits
VIC_SPR_SPR_COL = $d01e      ; vic-ii sprite vs sprite collision bits
VIC_SPR_BG_COL  = $d01f      ; vic-ii sprite vs background collision bits
VIC_BORDER      = $d020      ; vic-ii border color register
VIC_SPRITE_COLR = $d027      ; vic-ii 8 sprite color registers
CIA1_PORT_A     = $dc00      ; joystick 2
CIA1_PORT_B     = $dc01      ; joystick 1
CIA1_ICR        = $dc0d      ; cia 1 interrupt control and status register
CIA2_ICR        = $dd0d      ; cia 2 interrupt control and status register
NMI_VECTOR_LO   = $fffa      ; non-maskable interrupt vector low byte
NMI_VECTOR_HI   = $fffb      ; non-maskable interrupt vector high byte
MEMORY_CONFIG   = %00110101  ; disable basic kernal rom keep i/o at d000-dfff
PROCESSOR_PORT  = $01        ; processor port address
SPRITE_IX_OFST  = $3f8       ; sprite data index table offset from screen base
SCREEN_D018     = %00011000  ; screen at 0400 char map at 2000
SCREEN_WIDTH    = 40         ; screen width in characters
SCREEN_HEIGHT   = 25         ; screen height in characters
SCREEN_WIDTH_PX = 320        ; screen width in pixels for 40 column display
SCREEN_BRDR_LFT = 24         ; x of first visible pixel for 40 column display
SCREEN_BRDR_TOP = 50         ; y of first visible pixel for 25 row display
TILE_MAP_WIDTH  = 256        ; number of horizontal tiles
TILE_WIDTH      = 8          ; width of tile in pixels
TILE_PIXEL_MASK = %00000111  ; mask for pixel within tile 0-7
RASTER_BORDER   = 251        ; raster value below bottom border pal
KEYBOARD_ROW_0  = $fe        ; scan row 0 keys inst del return etc
KEYBOARD_RETURN = 2          ; bit mask for return key in row 0
JOYSTICK_UP     = 1          ; bit when joystick is up
JOYSTICK_DOWN   = 2          ; bit when joystick is down
JOYSTICK_LEFT   = 4          ; bit when joystick is left
JOYSTICK_RIGHT  = 8          ; bit when joystick is right
JOYSTICK_FIRE   = 16         ; bit when joystick is fire
COLOR_BLACK     = 0
COLOR_WHITE     = 1
COLOR_RED       = 2
COLOR_CYAN      = 3
COLOR_VIOLET    = 4
COLOR_GREEN     = 5
COLOR_BLUE      = 6
COLOR_YELLOW    = 7
COLOR_ORANGE    = 8
COLOR_BROWN     = 9
COLOR_LHT_RED   = 10
COLOR_GREY_1    = 11
COLOR_GREY_2    = 12
COLOR_LHT_GREEN = 13
COLOR_LHT_BLUE  = 14
COLOR_GREY_3    = 15
BORDER_COLOR    = COLOR_BLUE
BORDER_RENDER_1 = COLOR_GREEN
BORDER_RENDER_2 = COLOR_LHT_BLUE
BORDER_UPDATE   = COLOR_RED
BORDER_REFRESH  = COLOR_YELLOW

;
; tunable game constants
;

; horizontal movement velocity including subpixels
MOVE_DX = 8

; move skip (small jump) interval mask bitwise and is 0
MOVE_SKIP_INTERVAL = %1111

; move skip dy velocity including subpixels
MOVE_SKIP_VELOCITY = 20

; initial upward jump velocity including subpixels
JUMP_VELOCITY = 33

; gravity added to velocity when applied including subpixels
GRAVITY = 3

; gravity interval mask for non jumping hero bitwise and is 0
GRAVITY_INTERVAL = %1111

; restart position including subpixels
RESTART_X = (TILE_WIDTH / 2) << SUBPIXEL_SHIFT
RESTART_Y = -16 << SUBPIXEL_SHIFT

; animation rate masks bitwise and is 0
HERO_ANIMATION_RATE_MOVING = %111
HERO_ANIMATION_RATE_IDLE = %11111

; initial respawns for hero
INITIAL_INFINITIES = 7

; hero sprite color
HERO_SPRITE_COLOR = 1

; hud sprite color
HUD_SPRITE_COLOR = 1

; tile id for pickable items
TILE_ID_PICKABLE = 33

; tile id for empty tiles
TILE_ID_EMPTY = 32

; hero hardware sprite number
HERO_SPRITE_NUM = 0

; hud hardware sprite number
HUD_SPRITE_NUM = 7

; animation states (0 is reserved)
HERO_ANIMATION_IDLE = 1
HERO_ANIMATION_RIGHT = 2
HERO_ANIMATION_LEFT = 3

;
; constants coupled with graphics
;

; sprite data source for hud
HUD_SPRITE_DATA = sprites_data_47

; hud sprite index for vic-ii register
HUD_SPRITE_IX = HUD_SPRITE_DATA / 64

; hud start line for pickable count
HUD_PICKABLES_LINE = 4

; hud start line for infinity count
HUD_INFINITIES_LINE = 12

; hud start line for progress bar
HUD_PROGRESS_LINE = 18

;
; constants coupled with implementation
;

; count of subpixel fraction bits
SUBPIXEL_SHIFT = 4

; shift count for pixel to tile conversion
TILE_SHIFT = 3

; flags hero restart sequence on-going
HERO_FLAG_RESTARTING = 1

; flags hero is moving horizontally or in a jump
HERO_FLAG_MOVING = 2

; flags hero is in a jump
HERO_FLAG_JUMPING = 4

;-------------------------------------------------------------------------------
; animation struct with short name `n` for code brevity
;-------------------------------------------------------------------------------
.struct n
    id      .byte ; animation id
    frame   .byte ; current frame number
    rate    .byte ; frame rate mask bitwise and is 0
    ptr     .word ; pointer to animation data table
.endstruct

;-------------------------------------------------------------------------------

    ; coordinate system:
    ; - world coordinates are signed 16-bit fixed point
    ; - upper 12 bits = pixels
    ; - lower 4 bits = subpixels

;-------------------------------------------------------------------------------
; object struct with short name `o` for code brevity
;-------------------------------------------------------------------------------
.struct o
    wx       .word  ; world x position in pixels (fixed point 12.4)
    wy       .word  ; world y position in pixels (fixed point 12.4)
    dx       .word  ; x velocity in pixels/frame (fixed point 12.4, signed)
    dy       .word  ; y velocity in pixels/frame (fixed point 12.4, signed)
    wx_prv   .word  ; previous frame `wx`
    wy_prv   .word  ; previous frame `wy`
    anim     .tag n ; animation state
.endstruct

;-------------------------------------------------------------------------------
; zero page
;-------------------------------------------------------------------------------
.org $0002
.segment "ZERO_PAGE"
zero_page:
.out .sprintf("    zero_page: $%04x", zero_page)
camera_x:              .res 2  ; 16-bit world coordinate in pixels
screen_offset:         .res 1  ; horizontal fine scroll pixels 0-7
sprites_bg_collisions: .res 1  ; sprite to background collisions
hero_frame_counter:    .res 1  ; counter for bitwise and is 0 intervals
hero_pickables:        .res 1  ; count of picked items
hero_infinities:       .res 1  ; count of remaining restarts
hero_flags:            .res 1  ; flags defined in constants
tmp1:                  .res 1  ; primary temporary byte
tmp2:                  .res 1  ; secondary temporary byte or high byte of word
ptr1:                  .res 2  ; primary temporary pointer

.assert * <= $100, error, "zero page overflows"

;-------------------------------------------------------------------------------
; program header
;-------------------------------------------------------------------------------
.org $0000
.segment "HEADER"
header:
.word $0801                ; c64 prg load address hard-coded to BASIC segment

;-------------------------------------------------------------------------------
; stack
;-------------------------------------------------------------------------------
.org $0100
.segment "STACK"
stack:
.out .sprintf("        stack: $%04x", stack)
.res 256

;-------------------------------------------------------------------------------
; screen 0
;-------------------------------------------------------------------------------
.org $0400
.segment "SCREEN"
screen:
.out .sprintf("       screen: $%04x", screen)
.res 1000

;-------------------------------------------------------------------------------
; basic stub to jump to $5900: 10 sys 22784
;-------------------------------------------------------------------------------
.assert * <= $0801, error, "segment overflows into BASIC"
.org $0801
.segment "BASIC"
basic:
.out .sprintf("        basic: $%04x", basic)
.word $080b                 ; pointer to next basic line
.word 10                    ; line number
.byte $9e                   ; sys token
.byte "22784", 0            ; sys 22784 ($5900 in decimal)
.word 0                     ; end of basic program
.assert * = $80e, error, "segment BASIC has unexpected size"

;-------------------------------------------------------------------------------
; charset 0 (vic-ii sees rom mapped memory, cpu sees regular ram)
;-------------------------------------------------------------------------------
.assert * <= $1000, error, "segment overflows into CHARSET_0"
.org $1000
.segment "CHARSET_0"
charset_0:
.out .sprintf("    charset_0: $%04x", charset_0)
    .res $800

;-------------------------------------------------------------------------------
; charset 1 (vic-ii sees rom mapped memory, cpu sees regular ram)
;-------------------------------------------------------------------------------
.assert * <= $1800, error, "segment overflows into CHARSET_1"
.org $1800
.segment "CHARSET_1"
charset_1:
.out .sprintf("    charset_1: $%04x", charset_1)
    .res $800

;-------------------------------------------------------------------------------
; charset 2 (can be modified)
;-------------------------------------------------------------------------------
.assert * <= $2000, error, "segment overflows into CHARSET_2"
.org $2000
.segment "CHARSET_2"
charset_2:
.out .sprintf("    charset_2: $%04x", charset_2)
    .include "charset_2.s"

;-------------------------------------------------------------------------------
; charset 3 (can be modified)
;-------------------------------------------------------------------------------
.assert * <= $2800, error, "segment overflows into CHARSET_3"
.org $2800
.segment "CHARSET_3"
charset_3:
.out .sprintf("    charset_3: $%04x", charset_3)
    .incbin "../resources/charset_3.bin"

;-------------------------------------------------------------------------------
; sprites data
;-------------------------------------------------------------------------------
; 0x4000 - 0x3000 = 4096 / 64 = 64 sprites
.assert * <= $3000, error, "segment overflows into SPRITES_DATA"
.org $3000
.segment "SPRITES_DATA"
sprites_data:
.out .sprintf(" sprites_data: $%04x", sprites_data)
    .include "sprites_data.s"

;-------------------------------------------------------------------------------
; tile map
;-------------------------------------------------------------------------------
.assert * <= $4000, error, "segment overflows into TILE_MAP"
.segment "TILE_MAP"
.org $4000
tile_map:
.out .sprintf("     tile_map: $%04x", tile_map)
    .include "tile_map.s"

;-------------------------------------------------------------------------------
; program
;-------------------------------------------------------------------------------
.assert * <= $5900, error, "segment overflows into CODE"
.org $5900
.segment "CODE"
program:
.out .sprintf("      program: $%04x", program)

;-------------------------------------------------------------------------------
; set animation state if changed
;
;  input:
;    obj: object struct address
;    AID: animation id
;  ARATE: advance interval mask (bitwise and with frame counter)
; atable: animation frame table address
;
; output: obj animation struct set
;
;  clobbers: A, Y, ptr1
;-------------------------------------------------------------------------------
.macro OBJECT_ANIMATION obj, SPR, AID, ARATE, atable  
    ; if already animating this state, continue
    lda obj + o::anim + n::id
    cmp #AID
    beq :+

    lda #AID
    sta obj + o::anim + n::id

    lda #0
    sta obj + o::anim + n::frame

    lda #ARATE
    sta obj + o::anim + n::rate

    lda #<atable
    sta obj + o::anim + n::ptr
    sta ptr1
    lda #>atable
    sta obj + o::anim + n::ptr + 1
    sta ptr1 + 1

    ; set sprite to first frame
    ldy #0
    lda (ptr1), y
    SPRITE_SET_IX SPR 
    :
.endmacro

;-------------------------------------------------------------------------------
; advance animation frame if (fctr & rate) == 0
;
;  input:
;    obj: object struct address
;    SPR: hardware sprite number (0-7)
;   fctr: frame counter
;
; output: sprite updated if frame advanced
;
; clobbers: A, Y, ptr1
;-------------------------------------------------------------------------------
.macro OBJECT_ANIMATION_TICK obj, SPR, fctr
    lda fctr
    and obj + o::anim + n::rate
    bne :++ 
    ; note: quirk in ca65 local labels interfere with outer labels thus the use
    ;       of unnamed labels

    lda obj + o::anim + n::ptr
    sta ptr1
    lda obj + o::anim + n::ptr + 1
    sta ptr1 + 1

    ldy obj + o::anim + n::frame
    lda (ptr1), y
    bne :+
    ; last frame, loop back
    lda #0
    sta obj + o::anim + n::frame
    tay
    lda (ptr1), y
:   SPRITE_SET_IX SPR 
    inc obj + o::anim + n::frame
    :
.endmacro

;-------------------------------------------------------------------------------
; draw vertical bar graph on hud
;
;  input:
;  count: number of bars (0-7)
;   LINE: sprite row offset
;
; output: sprite data updated
;
; clobbers: A, X, Y
;-------------------------------------------------------------------------------
.macro HUD_BARS count, LINE
    lda count               ; load number of lines to draw
    asl                     ; multiply by 2 to get index into `hud_lines`
    tax                     ; x now holds the base index for the 2-byte pattern

    ldy #LINE * 3 + 1       ; 3 bytes per sprite row, second byte

    .repeat 3, I
        lda hud_lines, x
        sta HUD_SPRITE_DATA + 3 * I, y  ; row 1
        lda hud_lines + 1, x
        sta HUD_SPRITE_DATA + 1 + 3 * I, y
    .endrepeat
.endmacro

;-------------------------------------------------------------------------------
; add velocity to position
;
;  input:
;    obj: object struct address
;
; output: wx, wy updated, previous saved
;
; clobbers: A
;-------------------------------------------------------------------------------
.macro OBJECT_UPDATE obj
    ; save current state to previous
    lda obj + o::wx
    sta obj + o::wx_prv
    lda obj + o::wx + 1
    sta obj + o::wx_prv + 1
    lda obj + o::wy
    sta obj + o::wy_prv
    lda obj + o::wy + 1
    sta obj + o::wy_prv + 1

    ; add dx to x
    clc
    lda obj + o::wx
    adc obj + o::dx
    sta obj + o::wx
    lda obj + o::wx + 1
    adc obj + o::dx + 1
    sta obj + o::wx + 1

    ; add dy to y
    clc
    lda obj + o::wy
    adc obj + o::dy
    sta obj + o::wy
    lda obj + o::wy + 1
    adc obj + o::dy + 1
    sta obj + o::wy + 1
.endmacro

;-------------------------------------------------------------------------------
; convert object x to world pixel coordinate, sign-extended
;
;  input:
;    obj: object struct address
;
; output: tmp1, tmp2 = 16-bit pixel coordinate
;
; clobbers: A, tmp1, tmp2
;-------------------------------------------------------------------------------
.macro OBJECT_X_TO_WCS obj
    ; signed arithmetic shift right across 16 bits
    lda obj + o::wx
    sta tmp1
    lda obj + o::wx + 1
    .repeat SUBPIXEL_SHIFT
        cmp #$80            ; sets carry bit if negative preserving sign
        ror
        ror tmp1
    .endrepeat
    sta tmp2
.endmacro

;-------------------------------------------------------------------------------
; convert object world coordinates to screen and update sprite
;
;  input:
;    obj: object struct address
;    SPR: hardware sprite number (0-7)
;     cx: world pixel x (16-bit)
;
; output: sprite x, y, msb updated
;
; clobbers: A, X, tmp1
;-------------------------------------------------------------------------------
.macro OBJECT_SPRITE_TO_SCREEN obj, SPR, cx
    ; object world coordinates to screen by subtracting camera x position
    sec
    lda cx
    sbc camera_x
    sta cx
    lda cx + 1
    sbc camera_x + 1
    sta cx + 1

    ; add left border (40-column display)
    clc
    lda cx
    adc #SCREEN_BRDR_LFT
    sta cx
    lda cx + 1
    adc #0
    sta cx + 1

    ; update sprite position

    ; update sprite x position
    lda cx
    sta VIC_SPRITE_X + SPR * 2
    ; 2: sprite registers are x0, y0, x1, y1...

    ; set sprite x 9'th bit if `cx` is greater than 256
    lda VIC_SPRITES_8X
    and #<~(1 << SPR)       ; mask out sprite bit
    ldx cx + 1              ; check if high bits are 0
    beq :+
    ora #(1 << SPR)         ; set sprite x 9'th bit
:   sta VIC_SPRITES_8X

    ; update sprite y position

    ; fixed-point o::wy >> SUBPIXEL_SHIFT into `tmp1`
    lda obj + o::wy
    .repeat SUBPIXEL_SHIFT
        lsr
    .endrepeat
    sta tmp1                ; low bits in screen coordinates
    lda obj + o::wy + 1
    .repeat SUBPIXEL_SHIFT
        asl
    .endrepeat
    ora tmp1
    ; accumulator now contains y with 0 being at top of screen in border

    ; add top border (25 rows display)
    clc
    adc #SCREEN_BRDR_TOP

    ; update sprite y
    sta VIC_SPRITE_Y + SPR * 2
    ; 2: sprite registers are x0, y0, x1, y1...
.endmacro

;-------------------------------------------------------------------------------
; restore previous position
;
;  input:
;    obj: object struct address
;
; output: wx, wy restored
;
; clobbers: A
;-------------------------------------------------------------------------------
.macro OBJECT_RESTORE_STATE obj
    lda obj + o::wx_prv
    sta obj + o::wx
    lda obj + o::wx_prv + 1
    sta obj + o::wx + 1
    lda obj + o::wy_prv
    sta obj + o::wy
    lda obj + o::wy_prv + 1
    sta obj + o::wy + 1
.endmacro

;-------------------------------------------------------------------------------
; set sprite pointer, position
;
;  input:
;    SPR: hardware sprite number (0-7)
;     IX: sprite data pointer / 64
;     SX: screen x
;     SY: screen y
;
; output: sprite updated
;
; clobbers: A, X
;-------------------------------------------------------------------------------
.macro SPRITE_SET SPR, IX, SX, SY
    ; set sprite index for both screens
    lda #IX
    SPRITE_SET_IX SPR

    ; sprite x position
    lda #<SX
    sta VIC_SPRITE_X + SPR * 2
    ; 2: sprite registers are x0, y0, x1, y1...

    ; set sprite x 9'th bit if `cx` is greater than 256
    lda VIC_SPRITES_8X
    and #<~(1 << SPR)       ; mask out sprite bit
    ldx #>SX                ; check if high bits are 0
    beq :+
    ora #(1 << SPR)         ; set sprite x 9'th bit
:   sta VIC_SPRITES_8X

    ; set sprite y
    lda #SY
    sta VIC_SPRITE_Y + SPR * 2
    ; 2: sprite registers are x0, y0, x1, y1...
.endmacro

;-------------------------------------------------------------------------------
; enable sprite
;
;  input:
;    SPR: hardware sprite number (0-7)
;
; output: sprite updated
;
; clobbers: A
;-------------------------------------------------------------------------------
.macro SPRITE_ENABLE SPR
    lda VIC_SPRITE_ENBL
    ora #(1 << SPR)
    sta VIC_SPRITE_ENBL
.endmacro

;-------------------------------------------------------------------------------
; disable sprite
;
;  input:
;    SPR: hardware sprite number (0-7)
;
; output: sprite updated
;
; clobbers: A
;-------------------------------------------------------------------------------
.macro SPRITE_DISABLE SPR
    lda VIC_SPRITE_ENBL
    and #<~(1 << SPR)
    sta VIC_SPRITE_ENBL
.endmacro

;-------------------------------------------------------------------------------
; set sprite color
;
;  input:
;    SPR: hardware sprite number (0-7)
;  COLOR: color (0-15)
;
; output: sprite updated
;
; clobbers: A
;-------------------------------------------------------------------------------
.macro SPRITE_COLOR SPR, COLOR
    lda #COLOR
    sta VIC_SPRITE_COLR + SPR
.endmacro

;-------------------------------------------------------------------------------
; set sprite pointer for both screens
;
;  input:
;      A: sprite data pointer / 64
;    SPR: hardware sprite number (0-7)
;
; output: pointer in screen updated
;
; clobbers: none
;-------------------------------------------------------------------------------
.macro SPRITE_SET_IX SPR
    sta screen + SPRITE_IX_OFST + SPR
.endmacro

;-------------------------------------------------------------------------------
; center camera on x with bias
;
;  input:
;     cx: world x in pixels (16-bit)
;   BIAS: offset
;
; output: camera_x set
;
; clobbers: A
;-------------------------------------------------------------------------------
.macro CAMERA_CENTER_ON_X cx, BIAS
    sec
    lda cx
    sbc #SCREEN_WIDTH_PX / 2 + BIAS
    sta camera_x
    lda cx + 1
    sbc #0
    sta camera_x + 1
.endmacro

;-------------------------------------------------------------------------------
; check tile for item, if found increment pickables and clear
;
;  input:
;      Y: tile x
;   ptr1: tile row pointer
;
; output: pickables, tile set empty if item picked
;
; clobbers: A
;-------------------------------------------------------------------------------
.macro HERO_PICK
    lda (ptr1), y
    cmp #TILE_ID_PICKABLE
    bne :+
    inc hero_pickables
    lda #TILE_ID_EMPTY
    sta (ptr1), y
    :
.endmacro
;-------------------------------------------------------------------------------
    ;
    ; setup system 
    ;

    sei                     ; disable interrupts
    ldx #$ff                ; initialize stack
    txs                     ; copy x to sp
    cld                     ; clear decimal mode

    ; enable ram at $a000-$bfff and $e000-$ffff
    ; see https://sta.c64.org/cbm64mem.htm
    lda #MEMORY_CONFIG
    sta PROCESSOR_PORT
  
    ; disable cia timers
    ; cia interrupts latch even with sei
    lda #$7f                ; bit 7 = 0 (disable all)
    sta CIA1_ICR
    sta CIA2_ICR

    ; acknowledge any existing/pending interrupts
    lda CIA1_ICR
    lda CIA2_ICR

    ; turn off the shift-key/restore-key interrupt (nmi)
    lda #<nmi_handler
    sta NMI_VECTOR_LO
    lda #>nmi_handler
    sta NMI_VECTOR_HI

    ;
    ; setup first frame
    ;

    lda #0
    sta hero_flags
    sta hero_frame_counter
    sta hero_pickables
    lda #INITIAL_INFINITIES
    sta hero_infinities

    ; set background
    lda #COLOR_BLACK
    sta VIC_BG_COLOR

    ; set all color ram to white
    lda #COLOR_WHITE
    ldx #0                  ; initialize index
 :  sta color_ram + $000, x ; color ram starts at $d800
    sta color_ram + $100, x ; continue through
    sta color_ram + $200, x ; all 1000 bytes
    sta color_ram + $300, x ; of color memory
    inx
    bne :-                  ; loop until x wraps to 0
    ; also writes to 24 unused nibbles

    ; initiate hud sprite at top right of the screen
    SPRITE_SET HUD_SPRITE_NUM, HUD_SPRITE_IX, 310, 51
    SPRITE_COLOR HUD_SPRITE_NUM, HUD_SPRITE_COLOR
    SPRITE_ENABLE HUD_SPRITE_NUM

    ; initiate hero sprite 
    SPRITE_COLOR HERO_SPRITE_NUM, HERO_SPRITE_COLOR
    SPRITE_ENABLE HERO_SPRITE_NUM

    ; initiate screen and custom charset
    lda #SCREEN_D018
    sta VIC_MEM_CTRL


;-------------------------------------------------------------------------------


    ; frame pipeline:
    ; 1. main_loop - wait for raster, swap screens, set screen offset
    ; 2. update    - collisions, game logic, input, animation, physics, hud
    ; 3. refresh   - physics, camera, sprites update
    ; 4. render    - draw tile map to offscreen buffer

    ; step 2 and 3 must finish before raster is at top border
    ; step 4 must finish before raster is at bottom border


;-------------------------------------------------------------------------------
main_loop:
;-------------------------------------------------------------------------------

    ; synchronization point: must occur below bottom border on c64 pal

    lda #RASTER_BORDER
:   cmp VIC_RASTER_REG
    bne :-

;-------------------------------------------------------------------------------
update:
;-------------------------------------------------------------------------------
    ; note: previous x/y saved at `refresh`; state must be consistent after
    ;       `update`
 
    ; set border color to visualize duration of `update`
    lda #BORDER_UPDATE
    sta VIC_BORDER

@collision_reaction:
    ; read and save the collisions for this frame
    lda VIC_SPR_BG_COL
    sta sprites_bg_collisions

    ; if hero did not collide with background skip collision reaction
    and #(1 << HERO_SPRITE_NUM)
    beq @collision_reaction_done

    ; hero collided with background, restore previous x, y and set dx, dy to 0

    OBJECT_RESTORE_STATE hero

    lda #0
    ; note: `dx` will be set to 0 at `@input`
    sta hero + o::dy
    sta hero + o::dy + 1

    ; stop the jump and restart sequence
    lda hero_flags
    and #<(~HERO_FLAG_JUMPING & ~HERO_FLAG_RESTARTING)
    sta hero_flags

@collision_reaction_done:

@pickables:
    ; detect "pickables" in hero range

    ; convert hero world x, y to tile map coordinates

    ; note: assumes 4 subpixel bits and 3 tile bits effectively needing a 16 bit
    ;       left shift then using the high byte

    .assert SUBPIXEL_SHIFT = 4, error, "code assumes 4 subpixel fraction bits"
    .assert TILE_WIDTH = 8, error, "code assumes tile width to be 8"

    lda hero + o::wx
    rol
    lda hero + o::wx + 1
    rol
    ; accumulator is now tile x
    sta tmp1

    lda hero + o::wy
    rol
    lda hero + o::wy + 1
    rol
    ; accumulator is now tile y

    ; add to row pointer
    .assert TILE_MAP_WIDTH = 256, error, "tile_map width must be 256 for optimization"

    ; note: assumes row number is within range of 0 - 24

    clc
    adc #>tile_map
    sta ptr1 + 1
    .assert <tile_map = 0, error, "tile_map must be page-aligned"
    lda #0
    sta ptr1

    ldy tmp1                ; is now tile x

    ; check tiles for "pickables" (wraps horizontally)

    ; top left
    HERO_PICK

    ; top middle
    iny
    HERO_PICK

    ; top right
    iny
    HERO_PICK

    ; middle right
    inc ptr1 + 1
    HERO_PICK

    ; bottom right
    inc ptr1 + 1
    HERO_PICK

    ; bottom middle
    dey
    HERO_PICK

    ; bottom left
    dey
    HERO_PICK

    ; middle left
    dec ptr1 + 1
    HERO_PICK

@pickables_done:

@input:
    ; clear horizontal movement
    lda #0
    sta hero + o::dx 
    sta hero + o::dx + 1

    ; clear "hero is moving" flag
    lda hero_flags
    and #<~HERO_FLAG_MOVING
    sta hero_flags

@joystick_left:
    ; if joystick left is not active then continue to next step
    lda CIA1_PORT_A 
    and #JOYSTICK_LEFT
    bne @joystick_left_done  ; active low

    ; set "hero is moving" flag
    lda hero_flags
    ora #HERO_FLAG_MOVING
    sta hero_flags

    ; set hero animation for "left"
    OBJECT_ANIMATION hero, HERO_SPRITE_NUM, HERO_ANIMATION_LEFT, HERO_ANIMATION_RATE_MOVING, hero_animation_left


    ; set horizontal velocity
    lda #<-MOVE_DX
    sta hero + o::dx
    lda #>-MOVE_DX
    sta hero + o::dx + 1

    ; if not at skip (small jump) interval then continue to next step
    lda hero_frame_counter
    and #MOVE_SKIP_INTERVAL
    bne @joystick_left_done

    ; if there is vertical movement then don't skip (small jump)
    lda hero + o::dy
    ora hero + o::dy + 1
    bne @joystick_left_done

    ; set skip (small jump) `dy`
    lda #<-MOVE_SKIP_VELOCITY
    sta hero + o::dy
    lda #>-MOVE_SKIP_VELOCITY
    sta hero + o::dy + 1

@joystick_left_done:

@joystick_right:
    ; if joystick right is not active then continue to next step
    lda CIA1_PORT_A 
    and #JOYSTICK_RIGHT
    bne @joystick_right_done ; active low

    ; set "hero is moving" flag
    lda hero_flags
    ora #HERO_FLAG_MOVING
    sta hero_flags

    ; set hero animation for "right"
    OBJECT_ANIMATION hero, HERO_SPRITE_NUM, HERO_ANIMATION_RIGHT, HERO_ANIMATION_RATE_MOVING, hero_animation_right

    ; set horizontal velocity
    lda #<MOVE_DX
    sta hero + o::dx
    lda #>MOVE_DX
    sta hero + o::dx + 1

    ; if not at skip (small jump) interval then continue to next step
    lda hero_frame_counter
    and #MOVE_SKIP_INTERVAL
    bne @joystick_right_done

    ; if there is vertical movement then don't skip (small jump)
    lda hero + o::dy
    ora hero + o::dy + 1
    bne @joystick_right_done

    ; set skip (small jump) `dy`
    lda #<-MOVE_SKIP_VELOCITY
    sta hero + o::dy
    lda #>-MOVE_SKIP_VELOCITY
    sta hero + o::dy + 1

@joystick_right_done:

@joystick_fire:
    ; if hero is already jumping then jump to next step
    lda hero_flags
    and #HERO_FLAG_JUMPING
    bne @joystick_fire_done  ; active low

    ; if fire button is not pressed then jump to next step
    lda CIA1_PORT_A
    and #JOYSTICK_FIRE
    bne @joystick_fire_done  ; active low

    ; set vertical velocity for jump
    lda #<-JUMP_VELOCITY
    sta hero + o::dy
    lda #>-JUMP_VELOCITY
    sta hero + o::dy + 1

    ; flag hero as jumping and moving
    lda hero_flags
    ora #(HERO_FLAG_JUMPING | HERO_FLAG_MOVING)
    sta hero_flags

@joystick_fire_done:

@keyboard_return:
    ; if hero is in restart sequence then jump to next step
    lda hero_flags
    and #HERO_FLAG_RESTARTING
    bne @keyboard_return_done ; active low

    ; if key "return" is not pressed then jump to next step
    lda #KEYBOARD_ROW_0
    sta CIA1_PORT_A
    lda CIA1_PORT_B
    and #KEYBOARD_RETURN
    bne @keyboard_return_done ; active low

    ; if hero has no more "infinities" (respawns) then jump to next step 
    lda hero_infinities
    beq @keyboard_return_done

    ; restart sequence

    dec hero_infinities

    ; flag hero as restarting
    lda hero_flags
    ora #HERO_FLAG_RESTARTING
    sta hero_flags

    ; restart position and velocity
    lda #<RESTART_X
    sta hero + o::wx
    lda #>RESTART_X
    sta hero + o::wx + 1
    lda #<RESTART_Y 
    sta hero + o::wy
    lda #>RESTART_Y
    sta hero + o::wy + 1
    lda #0
    sta hero + o::dx
    sta hero + o::dx + 1
    sta hero + o::dy
    sta hero + o::dy + 1

@keyboard_return_done:

@input_done:

@hero_physics:
    ; if hero is moving then jump to next step
    lda hero_flags
    and #HERO_FLAG_MOVING
    bne @apply

    ; hero is not moving, initiate animation for "idle"
    OBJECT_ANIMATION hero, HERO_SPRITE_NUM, HERO_ANIMATION_IDLE, HERO_ANIMATION_RATE_IDLE, hero_animation_idle

@apply:
    ; if hero is jumping then jump to next step
    lda hero_flags
    and #HERO_FLAG_JUMPING
    bne @gravity
    ; note: skipping increment of `hero_frame_counter` when jumping freezes
    ;       animation which makes it look funny

    ; at regular intervals apply gravity for "floor" collision detection
    inc hero_frame_counter 
    ; note: best result when frame counter is increased here because of
    ;       interaction with the move "skip" use of same variable
    lda hero_frame_counter
    and #GRAVITY_INTERVAL
    beq @gravity

    ; skip gravity if `dy` is zero
    lda hero + o::dy
    ora hero + o::dy + 1
    beq @gravity_done

@gravity:
    ; increase `dy` by `GRAVITY`
    clc
    lda hero + o::dy
    adc #GRAVITY
    sta hero + o::dy
    lda hero + o::dy + 1 
    adc #0
    sta hero + o::dy + 1

@gravity_done:

@hero_physics_done:

@animation:
    ; animate hero
    OBJECT_ANIMATION_TICK hero, HERO_SPRITE_NUM, hero_frame_counter

@animation_done:

@hud:
    ; render hud lines
    HUD_BARS hero_pickables, HUD_PICKABLES_LINE 
    HUD_BARS hero_infinities, HUD_INFINITIES_LINE

    ; render progress bar

    ; get approximate number of dots in the line
    lda hero + o::wx + 1
    ; shift to fit graph of 21 dots
    lsr
    lsr
    lsr
    ; accumulator now contains number of dots in the progress line

    ; table look up of multiplication by 3
    tax
    lda multiply_by_3, x

    ; render on sprite
    tax
    ldy #HUD_PROGRESS_LINE * 3    ; 3 bytes per row, first byte
    lda progress_lines, x
    sta sprites_data_47, y
    inx
    iny
    lda progress_lines, x
    sta sprites_data_47, y
    inx
    iny
    lda progress_lines, x
    sta sprites_data_47, y

@hud_done:

;-------------------------------------------------------------------------------
sound:
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
refresh:
;-------------------------------------------------------------------------------

    ; set border color to visualize duration of `refresh`
    lda #BORDER_REFRESH
    sta VIC_BORDER

    ; update hero state
    OBJECT_UPDATE hero

    ; get world coordinate in pixels for hero x
    OBJECT_X_TO_WCS hero

    ; `tmp1` and `tmp2` now contain hero `wx` low, `wx` high pixels in world
    ; coordinates

    ; center camera on hero with offset for 16 pixels wide sprite
    CAMERA_CENTER_ON_X tmp1, -8

    ; place hero sprite in screen coordinates
    OBJECT_SPRITE_TO_SCREEN hero, HERO_SPRITE_NUM, tmp1

;-------------------------------------------------------------------------------
render:
;-------------------------------------------------------------------------------

    ; convert camera world pixel position to tile map coordinate + fine scroll
    ; offset

    ; example:
    ; | camera_x | offset | tile_map_x |
    ; | 0        | 0      | 0          |
    ; | 1        | 7      | 1          |
    ; | 2        | 6      | 1          |
    ; | 3        | 5      | 1          |
    ; | 4        | 4      | 1          |
    ; | 5        | 3      | 1          |
    ; | 6        | 2      | 1          |
    ; | 7        | 1      | 1          |
    ; | 8        | 0      | 1          |
    ; | 9        | 7      | 2          |
    ; | 10       | 6      | 2          |
    ; etc

    ; set border color to visualize duration of `render` and `render_tile_map`
    lda #BORDER_RENDER_1
    sta VIC_BORDER

    ; convert camera 16 bit pixel position to tile map x and screen right offset
    lda camera_x
    tax
    and #TILE_PIXEL_MASK    ; extract sub-tile pixel offset (0-7)
    tay
    lda tile_pixel_to_screen_offset, y
    sta screen_offset       ; rightward scroll amount for this frame
    sta VIC_CTRL_2

    ; note: from here on is "racing the beam" with the update being in front of
    ;       the raster to avoid screen tearing

    lda #BORDER_RENDER_2
    sta VIC_BORDER

    ; calculate tile map x: (camera_x hi << 5) | (camera_x lo >> 3) with
    ; adjustment if `screen_offset` != 0
    txa                     ; restore `camera_x` low
    .repeat TILE_SHIFT
        lsr
    .endrepeat
    sta tmp1                ; tmp1 = camera_x low >> 3
    lda camera_x + 1        ; get high byte
    .repeat 8 - TILE_SHIFT  ; 8: number of bits in a byte
        asl
    .endrepeat
    ora tmp1                ; combine: (hi << 5) | (lo >> 3)
    ldx screen_offset       ; check if `screen_offset` is 0
    beq :+                  ; if 0, no adjustment needed
    clc
    adc #1                  ; adjust tile x to match mapping table
:   tax                     ; transfer to register x used in `render_tile_map`

;-------------------------------------------------------------------------------
render_tile_map:
;-------------------------------------------------------------------------------

    ; register x contains tile map x
    ldy #0                  ; screen column start

@loop:
    ; generated unrolled render loop (avoids indirect addressing overhead)
    .include "render_to_screen.s"
    inx
    iny
    cpy #SCREEN_WIDTH
    beq @done
    jmp @loop

@done:
    ; restore border color
    lda #BORDER_COLOR
    sta VIC_BORDER

    jmp main_loop

;-------------------------------------------------------------------------------
nmi_handler:
;-------------------------------------------------------------------------------
    rti

;-------------------------------------------------------------------------------
.align 8
data:
;-------------------------------------------------------------------------------
hero:
    .word .loword(RESTART_X) ; wx
    .word .loword(RESTART_Y) ; wy 
    .word 0 ; dx
    .word 0 ; dy
    .word 0 ; wx_prv
    .word 0 ; wy_prv
    .byte 0 ; n::id
    .byte 0 ; n::frame
    .byte 0 ; n::rate
    .word 0 ; n::ptr

;-------------------------------------------------------------------------------
tile_pixel_to_screen_offset: ; used in `render`
;-------------------------------------------------------------------------------
.byte 0, 7, 6, 5, 4, 3, 2, 1

;-------------------------------------------------------------------------------
multiply_by_3: ; used in `update:@hud`, 32 entries
;-------------------------------------------------------------------------------
.byte 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54
.byte 57, 60, 63, 66, 69, 72, 75, 78, 81, 84, 87, 90, 93

;-------------------------------------------------------------------------------
hud_lines: ; used in `HUD_BARS`
;-------------------------------------------------------------------------------
.byte %11111111, %11111111
.byte %01111111, %11111111
.byte %01011111, %11111111
.byte %01010111, %11111111
.byte %01010101, %11111111
.byte %01010101, %01111111
.byte %01010101, %01011111
.byte %01010101, %01010111
.byte %01010101, %01010101

;-------------------------------------------------------------------------------
progress_lines: ; used in `update:@hud`
;-------------------------------------------------------------------------------
.byte %11000000, %00000000, %00000011
.byte %11100000, %00000000, %00000011
.byte %11110000, %00000000, %00000011
.byte %11111000, %00000000, %00000011
.byte %11111100, %00000000, %00000011
.byte %11111110, %00000000, %00000011
.byte %11111111, %00000000, %00000011
.byte %11111111, %10000000, %00000011
.byte %11111111, %11000000, %00000011
.byte %11111111, %11100000, %00000011
.byte %11111111, %11110000, %00000011
.byte %11111111, %11111000, %00000011
.byte %11111111, %11111100, %00000011
.byte %11111111, %11111110, %00000011
.byte %11111111, %11111111, %00000011
.byte %11111111, %11111111, %10000011
.byte %11111111, %11111111, %11000011
.byte %11111111, %11111111, %11100011
.byte %11111111, %11111111, %11110011
.byte %11111111, %11111111, %11111011
.byte %11111111, %11111111, %11111111
.byte %11000000, %00000000, %00000011
.byte %11000000, %00000000, %00000011
.byte %11000000, %00000000, %00000011
.byte %11000000, %00000000, %00000011
.byte %11000000, %00000000, %00000011
.byte %11000000, %00000000, %00000011
.byte %11000000, %00000000, %00000011
.byte %11000000, %00000000, %00000011
.byte %11000000, %00000000, %00000011
.byte %11000000, %00000000, %00000011
.byte %11000000, %00000000, %00000011

;-------------------------------------------------------------------------------
hero_animation_idle: ; used in `update`
;-------------------------------------------------------------------------------
.byte sprites_data / 64 + 8
.byte sprites_data / 64 + 9
.byte sprites_data / 64 + 10
.byte sprites_data / 64 + 9
.byte 0

;-------------------------------------------------------------------------------
hero_animation_right: ; used in `update`
;-------------------------------------------------------------------------------
.byte sprites_data / 64 + 1
.byte sprites_data / 64 + 0
.byte 0

;-------------------------------------------------------------------------------
hero_animation_left: ; used in `update`
;-------------------------------------------------------------------------------
.byte sprites_data / 64 + 3
.byte sprites_data / 64 + 2
.byte 0

;-------------------------------------------------------------------------------
data_done:
.assert * < $d000, error, "segment overflows into I/O"

;-------------------------------------------------------------------------------
; color ram
;-------------------------------------------------------------------------------
.assert * <= $d800, error, "segment overflows into COLOR_RAM"
.org $d800
.segment "COLOR_RAM"
color_ram:
.out .sprintf("    color_ram: $%04x", color_ram)
    .res 1000

;-------------------------------------------------------------------------------
.out .sprintf("--------------------")
.out .sprintf("         code: %d B", data - program)
.out .sprintf("         data: %d B", data_done - data)
.out .sprintf("         free: %d B", $d000 - data_done)
.out .sprintf("--------------------")
;-------------------------------------------------------------------------------
