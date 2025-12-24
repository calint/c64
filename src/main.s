;-------------------------------------------------------------------------------
; mapped memory
;-------------------------------------------------------------------------------
; $0002 - $00ff: zero page
; $0400 - $07e7: default screen (screen 0)
; $07f8 - $07ff: sprites data index to address/64 when screen 0 is active
; $0800        : byte must be 0 so BASIC stub at $0801 works
; $0801 - $080d: basic stub to jump to $5900
; $1000 - $17ff: default character set (note: vic-ii chip sees rom data)
; $1800 - $1fff: alternate character set (note: vic-ii chip sees rom data)
; $2000 - $27ff: user defined character set 1
; $2800 - $2fff: user defined character set 2
; $3000 - $3bff: 48 sprite definition data
; $3c00 - $3fe7: double buffer screen (screen 1)
; $3ff8 - $3fff: sprites data index to address/64 when screen 1 is active
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
VIC_SPRITE_X    = $d000     ; vic-ii sprite 0 x lower 8 bits
VIC_SPRITE_Y    = $d001     ; vic-ii sprite 0 y
VIC_SPRITES_8X  = $d010     ; vic-ii 9'th bit of x for sprites 0-7
VIC_CTRL_1      = $d011     ; vic-ii control register 1
VIC_RASTER_REG  = $d012     ; vic-ii raster register
VIC_SPRITE_ENBL = $d015     ; vic-ii sprite enable bits
VIC_CTRL_2      = $d016     ; vic-ii screen control register 2
VIC_SPRITE_DBLY = $d017     ; vic-ii double sprites height bits
VIC_MEM_CTRL    = $d018     ; vic-ii memory control register
VIC_IRQ_REG     = $d019     ; vic-ii interrupt register
VIC_BG_COLOR    = $d021     ; vic-ii background color register
VIC_IRQ_ENABLE  = $d01a     ; vic-ii interrupt enable register
VIC_SPRITE_DBLX = $d01d     ; vic-ii double sprites width bits
VIC_SPR_SPR_COL = $d01e     ; vic-ii sprite vs sprite collision bits
VIC_SPR_BG_COL  = $d01f     ; vic-ii sprite vs background collision bits
VIC_BORDER      = $d020     ; vic-ii border color register
VIC_SPRITE_COLR = $d027     ; vic-ii 8 sprite colors
CIA1_PORT_A     = $dc00     ; joystick 2
CIA1_PORT_B     = $dc01     ; joystick 1
CIA1_ICR        = $dc0d     ; cia 1 interrupt control and status register
CIA2_ICR        = $dd0d     ; cia 2 interrupt control and status register
NMI_VECTOR_LO   = $fffa     ; non-maskable interrupt vector (low byte)
NMI_VECTOR_HI   = $fffb     ; non-maskable interrupt vector (high byte)
MEMORY_CONFIG   = %00110101 ; disable basic/kernal rom, keep i/o at $d000–$dfff
PROCESSOR_PORT  = $0001     ; processor port address
SPRITE_IX_OFST  = $3f8      ; sprite data index table offset from screen address
SCREEN_0_D018   = %00011000 ; screen at $0400, char map at $2000
SCREEN_1_D018   = %11111000 ; screen at $3c00, char map at $2000 
SCREEN_WIDTH    = 40        ; screen width in characters
SCREEN_HEIGHT   = 25        ; screen height in characters
SCREEN_WIDTH_PX = 320       ; screen width in pixels for 40 column display
SCREEN_BRDR_LFT = 24        ; x of first visible pixel (40 column display)
SCREEN_BRDR_TOP = 50        ; y of first visible pixel
TILE_MAP_WIDTH  = 256       ; number of horizontal tiles
TILE_WIDTH      = 8         ; width of tile in pixels
TILE_PIXEL_MASK = %00000111 ; mask for pixel within tile (0-7)
RASTER_BORDER   = 251       ; raster value below bottom border (PAL)
KEYBOARD_ROW_0  = $fe       ; scan row 0 (keys: inst/del, return, etc.)
KEYBOARD_RETURN = 2         ; bit mask for "return" key in row 0
JOYSTICK_UP     = 1         ; bit when joystick is up
JOYSTICK_DOWN   = 2         ; bit when joystick is down
JOYSTICK_LEFT   = 4         ; bit when joystick is left
JOYSTICK_RIGHT  = 8         ; bit when joystick is right
JOYSTICK_FIRE   = 16        ; bit when joystick is fire
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
BORDER_RENDER   = COLOR_LHT_BLUE
BORDER_UPDATE   = COLOR_RED
BORDER_REFRESH  = COLOR_YELLOW 

;
; tunable game constants
;

; moving velocity to left and right (including subpixels)
MOVE_DX = 8

; when moving, hero makes a "skip" (a small jump) at interval mask (AND is 0)
MOVE_SKIP_INTERVAL = %1111

; amount of dy when hero "skips" while moving (including subpixels)
MOVE_SKIP_VELOCITY = 20

; initial velocity upwards when jumping (including subpixels)
JUMP_VELOCITY = 33

; gravity to add to velocity every frame (including subpixels)
GRAVITY = 3

; gravity applied when hero is not jumping at interval mask (AND is 0)
GRAVITY_INTERVAL = %1111

; restarting position including subpixels
RESTART_X = (TILE_WIDTH / 2) << SUBPIXEL_SHIFT
RESTART_Y = -16 << SUBPIXEL_SHIFT

; animation rate masks (AND is 0)
HERO_ANIMATION_RATE_MOVING = %111
HERO_ANIMATION_RATE_IDLE = %11111

; initial infinities (respawns) hero has
INITIAL_INFINITIES = 7

; hero sprite color
HERO_SPRITE_COLOR = 1

; hud sprite color
HUD_SPRITE_COLOR = 1

; tile id for pickable item
TILE_ID_PICKABLE = 33

; tile id for empty
TILE_ID_EMPTY = 32

; hero hardware sprite number
HERO_SPRITE_NUM = 0

; hud hardware sprite number
HUD_SPRITE_NUM = 7

;
; constants coupled with graphics
;

; hero sprite data for use in register
HERO_SPRITE_IX = sprites_data_0 >> 6

; sprite used for hud
HUD_SPRITE_DATA = sprites_data_47

; hud sprite data for use in register
HUD_SPRITE_IX = HUD_SPRITE_DATA >> 6

; hud start line to draw number of pickables
HUD_PICKABLES_LINE = 4

; hud start line to draw number of infinities
HUD_INFINITIES_LINE = 12

; hud start line for progress bar
HUD_PROGRESS_LINE = 18

;
; hard constants coupled with implementation
;

; number of subpixel fraction bits are used
SUBPIXEL_SHIFT = 4

; number of shifts to convert pixels to tile
TILE_SHIFT = 3

; animation enumeration
HERO_ANIMATION_IDLE = 0
HERO_ANIMATION_RIGHT = 1
HERO_ANIMATION_LEFT = 2

;-------------------------------------------------------------------------------
; animation struct with short name `n` for code brevity
;-------------------------------------------------------------------------------
.struct n
    id      .byte ; unique animation id
    frame   .byte ; frame number in animation
    rate    .byte ; frame rate as a bitmask that is ANDed and checked for 0
    ptr     .word ; pointer to animation table
.endstruct

;-------------------------------------------------------------------------------
; object struct with short name `o` for code brevity
;-------------------------------------------------------------------------------
.struct o
    x_lo     .byte
    x_hi     .byte
    y_lo     .byte
    y_hi     .byte
    dx_lo    .byte
    dx_hi    .byte
    dy_lo    .byte
    dy_hi    .byte
    sprite   .byte ; sprite data address / 64
    x_prv_lo .byte
    x_prv_hi .byte
    y_prv_lo .byte
    y_prv_hi .byte
    anim     .tag n
.endstruct

;-------------------------------------------------------------------------------
; zero page
;-------------------------------------------------------------------------------
.org $0002
.segment "ZERO_PAGE"
zero_page:
.out .sprintf("    zero_page: $%04x", zero_page)
camera_x_lo:           .res 1  ; low byte of camera x
camera_x_hi:           .res 1  ; high byte of camera x
screen_offset:         .res 1  ; number of pixels (0-7) screen is shifted right
screen_active:         .res 1  ; active screen (0 or 1)
sprites_bg_collisions: .res 1  ; sprite / background collisions
frame_counter:         .res 1  ; frame counter used for AND = 0 intervals
hero_pickables:        .res 1  ; number of picked items
hero_infinities:       .res 1  ; number of restarts remaining
hero_restarting:       .res 1  ; 0 when not restarting sequence
hero_moving:           .res 1  ; 0 if hero is idle
hero_jumping:          .res 1  ; 0 if not in jump
tmp1:                  .res 1  ; temporary
tmp2:                  .res 1  ; temporary (after tmp1 to form temporary word)
ptr1:                  .res 2  ; temporary pointer

;-------------------------------------------------------------------------------
; program header
;-------------------------------------------------------------------------------
.org $0000
.segment "HEADER"
header:
.word $0801                ; prg load address hard-coded to BASIC segment

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
.segment "SCREEN_0"
screen_0:
.out .sprintf("     screen_0: $%04x", screen_0)
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
; charset 0 (note: vic-ii sees rom mapped memory, cpu sees regular ram)
;-------------------------------------------------------------------------------
.assert * <= $1000, error, "segment overflows into CHARSET_0"
.org $1000
.segment "CHARSET_0"
charset_0:
.out .sprintf("    charset_0: $%04x", charset_0)
    .res $0800

;-------------------------------------------------------------------------------
; charset 1 (note: vic-ii sees rom mapped memory, cpu sees regular ram)
;-------------------------------------------------------------------------------
.assert * <= $1800, error, "segment overflows into CHARSET_1"
.org $1800
.segment "CHARSET_1"
charset_1:
.out .sprintf("    charset_1: $%04x", charset_1)
    .res $0800

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
; 0x3c00 - 0x3000 = 3072 / 64 = 48 sprites
.assert * <= $3000, error, "segment overflows into SPRITES_DATA"
.org $3000
.segment "SPRITES_DATA"
sprites_data:
.out .sprintf(" sprites_data: $%04x", sprites_data)
    .include "sprites_data.s"

;-------------------------------------------------------------------------------
; screen 1
;-------------------------------------------------------------------------------
.assert * <= $3c00, error, "segment overflows into SCREEN_1"
.org $3c00
.segment "SCREEN_1"
screen_1:
.out .sprintf("     screen_1: $%04x", screen_1)
    .res $400

;-------------------------------------------------------------------------------
; tile map
;-------------------------------------------------------------------------------
.assert * <= $4000, error, "segment overflows into TILE_MAP"
.segment "TILE_MAP"
.org $4000
tile_map:                   ; the tile map included from resources
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
; populate object animation struct with initial values if not already animating
; same id
; 
;  input:
;           obj: address of object struct
;       anim_id: animation id
;     anim_rate: rate of animation mask (AND = 0)
;    anim_table: address of animation sequence
;
; output: -
;
; clobbers: a
;-------------------------------------------------------------------------------
.macro OBJECT_ANIMATION obj, anim_id, anim_rate, anim_table  
    ; if already animating this state, continue
    lda obj + o::anim + n::id
    cmp #anim_id
    beq :+

    lda #anim_id
    sta obj + o::anim + n::id

    lda #0
    sta obj + o::anim + n::frame

    lda #anim_rate
    sta obj + o::anim + n::rate

    lda #<anim_table
    sta obj + o::anim + n::ptr
    lda #>anim_table
    sta obj + o::anim + n::ptr + 1
    :
.endmacro

;-------------------------------------------------------------------------------
; advance animation frame if rate AND frame_counter == 0
;
;  input:
;    obj: address of object struct
;
; output: -
;
; clobbers: a, y, ptr1
;-------------------------------------------------------------------------------
.macro OBJECT_ANIMATION_NEXT obj
    lda frame_counter
    and obj + o::anim + n::rate
    bne :++

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
:   sta obj + o::sprite
    inc obj + o::anim + n::frame
    :
.endmacro

;-------------------------------------------------------------------------------
; render vertical bars on hud sprite 
;
;  input:
;    var: number of bars
;   LINE: render on sprite hud line number
;
; output: -
;
; clobbers: a, x, y
;-------------------------------------------------------------------------------
.macro HUD_BARS var, LINE
    lda var                 ; load number of lines to draw
    asl                     ; multiply by 2 to get index into `hud_lines`
    tax                     ; x now holds the base index for the 2-byte pattern

    ldy #LINE * 3 + 1       ; 3 bytes per sprite row, second byte
    lda hud_lines, x
    sta HUD_SPRITE_DATA, y  ; row 1
    lda hud_lines + 1, x
    sta HUD_SPRITE_DATA + 1, y
 
    lda hud_lines, x
    sta HUD_SPRITE_DATA + 3, y ; row 2 (+3 bytes per sprite row)
    lda hud_lines + 1, x
    sta HUD_SPRITE_DATA + 4, y
 
    lda hud_lines, x
    sta HUD_SPRITE_DATA + 6, y ; row 3
    lda hud_lines + 1, x
    sta HUD_SPRITE_DATA + 7, y
.endmacro

;-------------------------------------------------------------------------------
; refresh x, y using dx, dy and update sprite definition data
;
;  input:
;    obj: address of object struct
;    spr: address of sprite struct used by object
;
; output: -
;
; clobbers: a
;-------------------------------------------------------------------------------
.macro OBJECT_UPDATE obj
    ; save current state to previous
    lda obj + o::x_lo
    sta obj + o::x_prv_lo
    lda obj + o::x_hi
    sta obj + o::x_prv_hi
    lda obj + o::y_lo
    sta obj + o::y_prv_lo
    lda obj + o::y_hi
    sta obj + o::y_prv_hi

    ; add dx to x
    clc
    lda obj + o::x_lo
    adc obj + o::dx_lo
    sta obj + o::x_lo
    lda obj + o::x_hi
    adc obj + o::dx_hi
    sta obj + o::x_hi

    ; add dy to y
    clc
    lda obj + o::y_lo
    adc obj + o::dy_lo
    sta obj + o::y_lo
    lda obj + o::y_hi
    adc obj + o::dy_hi
    sta obj + o::y_hi
.endmacro

;-------------------------------------------------------------------------------
; converts object's fixed-point x position to integer world pixels
; (arithmetic shift right by SUBPIXEL_SHIFT)
;
;    input:
;      obj: address to object struct
;
;   output:
;     tmp1: x low byte
;     tmp2: x high byte
;
; clobbers: a, tmp1, tmp2
;-------------------------------------------------------------------------------
.macro OBJECT_X_TO_WCS obj
    ; signed arithmetic shift right across 16 bits
    lda obj + o::x_lo
    sta tmp1
    lda obj + o::x_hi
    .repeat SUBPIXEL_SHIFT
        cmp #$80            ; sets carry bit if negative preserving sign
        ror
        ror tmp1
    .endrepeat
    sta tmp2
.endmacro

;-------------------------------------------------------------------------------
; updates object sprite position by converting camera coordinates to screen
;
;  input:
;     obj: address of object struct
;     spr: address of sprite struct
; SPR_BIT: hardware sprite bit
;      cx: 16 bit object x in camera coordinate system
;
; output: -
;
; clobbers: a, x, tmp1
;-------------------------------------------------------------------------------
.macro OBJECT_UPDATE_SPRITE obj, SPR_NUM, SPR_COLOR, cx
    ; put object coordinates on screen by subtracting camera x position
    sec
    lda cx
    sbc camera_x_lo
    sta cx
    lda cx + 1
    sbc camera_x_hi
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
    sta VIC_SPRITE_X + SPR_NUM * 2
    ; note: 2 because sprite registers are bytes: x0, y0, x1, y1 etc

    ; set sprite x 9'th bit if `cx` is greater than 256
    lda VIC_SPRITES_8X
    and #<~(1 << SPR_NUM)   ; mask out sprite bit
    ldx cx + 1              ; check if high bits are 0
    beq :+
    ora #(1 << SPR_NUM)     ; set sprite x 9'th bit
:   sta VIC_SPRITES_8X

    ; update sprite y position

    ; remove subpixels and compose y into `tmp1`
    lda obj + o::y_lo
    .repeat SUBPIXEL_SHIFT
        lsr
    .endrepeat
    sta tmp1                ; low bits in screen coordinates
    lda obj + o::y_hi
    .repeat SUBPIXEL_SHIFT
        asl
    .endrepeat
    ora tmp1
    ; accumulator now contains y with 0 being at top of screen within border

    ; add top border (25 rows display)
    clc
    adc #SCREEN_BRDR_TOP
    sta VIC_SPRITE_Y + SPR_NUM * 2
    ; note: 2 because sprite registers are bytes: x0, y0, x1, y1 etc
 

    lda #SPR_COLOR
    sta VIC_SPRITE_COLR + SPR_NUM

    ; update sprite data index
    lda obj + o::sprite
    sta screen_0 + SPRITE_IX_OFST + SPR_NUM
    sta screen_1 + SPRITE_IX_OFST + SPR_NUM

    lda VIC_SPRITE_ENBL
    ora #(1 << SPR_NUM)
    sta VIC_SPRITE_ENBL
.endmacro


;-------------------------------------------------------------------------------
; initiates a sprite by assigning image data, color and screen x, y and enabling
; it
;
;  input:
;    NUM: sprite hardware number starting at 0 through 7
;     IX: sprite data address / 64
;  COLOR: initial color
;     SX: 16 bit screen x
;     SY: screen y
;
; output: -
;
; clobbers: a, x
;-------------------------------------------------------------------------------
.macro SPRITE_INIT NUM, IX, COLOR, SX, SY
    ; set sprite index for both screens
    lda #IX
    sta screen_0 + SPRITE_IX_OFST + NUM
    sta screen_1 + SPRITE_IX_OFST + NUM

    ; sprite x position
    lda #<SX
    sta VIC_SPRITE_X + NUM * 2
    ; note: 2 because sprite registers are bytes: x0, y0, x1, y1 etc

    ; set sprite x 9'th bit if `cx` is greater than 256
    lda VIC_SPRITES_8X
    and #<~(1 << NUM)       ; mask out sprite bit
    ldx #>SX                ; check if high bits are 0
    beq :+
    ora #(1 << NUM)         ; set sprite x 9'th bit
:   sta VIC_SPRITES_8X

    ; set sprite y
    lda #SY
    sta VIC_SPRITE_Y + NUM * 2
    ; note: 2 because sprite registers are bytes: x0, y0, x1, y1 etc

    ; color
    lda #COLOR
    sta VIC_SPRITE_COLR + NUM

    ; enable
    lda VIC_SPRITE_ENBL
    ora #(1 << NUM)
    sta VIC_SPRITE_ENBL
.endmacro

;-------------------------------------------------------------------------------
; restore object state by writing x, y, dx, dy with previous frame values
;
;  input:
;    obj: address to object struct
;
; output: -
;
; clobbers: a
;-------------------------------------------------------------------------------
.macro OBJECT_RESTORE_STATE obj
    lda obj + o::x_prv_lo
    sta obj + o::x_lo
    lda obj + o::x_prv_hi
    sta obj + o::x_hi
    lda obj + o::y_prv_lo
    sta obj + o::y_lo
    lda obj + o::y_prv_hi
    sta obj + o::y_hi
.endmacro

;-------------------------------------------------------------------------------
; centers camera on specified x adding a bias
;
;  input:
;     cx: 16 bit x to center on
;   BIAS: bias added to calculated center
;
; output:
;   camera_x_lo
;   camera_x_hi
;
; clobbers: a
;-------------------------------------------------------------------------------
.macro CAMERA_CENTER_ON_X cx, BIAS
    sec
    lda cx
    sbc #SCREEN_WIDTH_PX / 2 + BIAS
    sta camera_x_lo
    lda cx + 1
    sbc #0
    sta camera_x_hi
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
    ; note: even with `sei`, these chips "latch" interrupts
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
    sta camera_x_lo
    sta camera_x_hi
    sta screen_active
    sta hero_jumping
    sta hero_moving
    sta frame_counter
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
    ; note: also writes to the unused 24 nibbles

    ; place hud sprite on screen
    SPRITE_INIT HUD_SPRITE_NUM, HUD_SPRITE_IX, HUD_SPRITE_COLOR, 310, 51

    ; frame pipeline:
    ; 1. main_loop - wait for raster, swap screens, set screen offset
    ; 2. update    - collisions, game logic, input, animation, physics, hud
    ; 3. refresh   - physics, camera, apply state to sprites
    ; 4. render    - draw tile map to offscreen buffer

    ; coordinate system:
    ; - world coordinates are signed 16-bit fixed point
    ; - upper 12 bits = pixels
    ; - lower 4 bits = subpixels


;-------------------------------------------------------------------------------
main_loop:
;-------------------------------------------------------------------------------

    ; synchronization point: must occur below bottom border on pal
    ; (raster >= 251)
    ; note: timing and raster values assume pal c64

    lda #RASTER_BORDER
:   cmp VIC_RASTER_REG
    bne :-

    ; swap screens
    lda screen_active       ; load active screen
    eor #1                  ; swap to next active screen
    sta screen_active
    lda #SCREEN_0_D018      ; default is to activate screen 0
    ldx screen_active       ; load next active screen
    bne :+                  ; if next activate screen is 1 then swap to 0
    lda #SCREEN_1_D018      ; next active screen is 0, swap to 1
:   sta VIC_MEM_CTRL

    ; set screen right offset in vblank, takes effect next frame
    lda screen_offset
    sta VIC_CTRL_2

;-------------------------------------------------------------------------------
update:
;-------------------------------------------------------------------------------
    ; note: previous x and y for objects are saved at `refresh`
    ;       state must be consistent when `update` is done
 
    ; give visual for number of scan lines `update` uses
    lda #BORDER_UPDATE
    sta VIC_BORDER

    ; read and save the collisions for this frame
    lda VIC_SPR_BG_COL
    sta sprites_bg_collisions

    ; check if hero sprite has collided with background
    and #(1 << HERO_SPRITE_NUM)
    beq @collision_reaction_done

    ; hero has collided with background, restore state to previous x,y and set
    ; dx, dy to 0

    OBJECT_RESTORE_STATE hero

    lda #0
    ; note: `dx_lo` and `dx_hi` will be set to 0 in `@controls`
    sta hero + o::dy_lo
    sta hero + o::dy_hi

    ; stop the jump logic
    sta hero_jumping

    ; restart sequence done
    sta hero_restarting

@collision_reaction_done:

@pickables:
    ; check for collision with pickables

    ; convert hero world x, y to tile map coordinates

    ; bias by half a tile, then extract tile coordinate via bit rotation

    ; note: assumes 4 subpixels bits and 3 tile pixels bits effectively needing
    ;       to do a 16 bit left shift and using the high byte but rounding
    ;       complicates it

    .assert SUBPIXEL_SHIFT = 4, error, "code assumes 4 subpixel fraction bits"
    .assert TILE_WIDTH = 8, error, "code assumes tile width to be 8"

    lda hero + o::x_lo
    clc
    adc #(TILE_WIDTH / 2) << SUBPIXEL_SHIFT
    tax                     ; save `x_lo` for later
    lda hero + o::x_hi
    adc #0                  ; propagate carry into the high byte
    tay                     ; save intermediate `x_hi` into register y
    txa                     ; restore `x_lo`
    rol                     ; rotate bit 7 into carry
    tya                     ; restore `x_hi`
    rol                     ; rotate carry into bit 0
    ; accumulator is now tile x
    sta tmp1

    lda hero + o::y_lo
    clc
    adc #(TILE_WIDTH / 2) << SUBPIXEL_SHIFT
    tax                     ; save `y_lo` for later
    lda hero + o::y_hi
    adc #0                  ; propagate carry into the high byte
    tay                     ; save intermediate `y_hi` for later
    txa                     ; restore `y_lo`
    rol                     ; rotate bit 7 into carry
    tya                     ; restore `y_hi`
    rol                     ; rotate carry into bit 0
    ; accumulator is now tile y

    ; add it to row pointer
    .assert TILE_MAP_WIDTH = 256, error, "tile_map must be 256 for optimization"
    clc
    adc #>tile_map
    sta ptr1 + 1
    .assert <tile_map = 0, error, "tile_map must be page-aligned"
    lda #0
    sta ptr1

    ldy tmp1                ; is now tile x

    ; check tiles for pickables
    ; not fully correct but makes for good game play
    ; note: wraps horizontally into a cylindrical world

    ; check top left tile
    lda (ptr1), y
    cmp #TILE_ID_PICKABLE
    bne :+
    inc hero_pickables
    lda #TILE_ID_EMPTY
    sta (ptr1), y

    ; check top right tile
:   iny
    lda (ptr1), y
    cmp #TILE_ID_PICKABLE
    bne :+
    inc hero_pickables
    lda #TILE_ID_EMPTY
    sta (ptr1), y

    ; check bottom right tile
:   inc ptr1 + 1
    lda (ptr1), y
    cmp #TILE_ID_PICKABLE
    bne :+
    inc hero_pickables
    lda #TILE_ID_EMPTY
    sta (ptr1), y

    ; check bottom left tile
:   dey
    lda (ptr1), y
    cmp #TILE_ID_PICKABLE
    bne :+
    inc hero_pickables
    lda #TILE_ID_EMPTY
    sta (ptr1), y
    :

@pickables_done:

@controls:
    ; set non horizontal movement
    lda #0
    sta hero + o::dx_lo 
    sta hero + o::dx_hi
    sta hero_moving

@joystick_left:
    ; joystick
    lda CIA1_PORT_A 
    and #JOYSTICK_LEFT
    bne @joystick_right     ; note: active low

    ; flag hero is moving, non-zero value means "moving"
    inc hero_moving

    OBJECT_ANIMATION hero, HERO_ANIMATION_LEFT, HERO_ANIMATION_RATE_MOVING, hero_animation_left

    lda #<-MOVE_DX
    sta hero + o::dx_lo
    lda #>-MOVE_DX
    sta hero + o::dx_hi

    ; regularly "skip" (small jump) when moving
    lda frame_counter
    and #MOVE_SKIP_INTERVAL
    bne @joystick_right

    ; "skip" if dy is 0
    lda hero + o::dy_lo
    ora hero + o::dy_hi
    bne @joystick_right

    ; "skip" by a negative dy
    lda #<-MOVE_SKIP_VELOCITY
    sta hero + o::dy_lo
    lda #>-MOVE_SKIP_VELOCITY
    sta hero + o::dy_hi

@joystick_right:
    lda CIA1_PORT_A 
    and #JOYSTICK_RIGHT
    bne @joystick_fire      ; note: active low

    ; flag hero is moving, non-zero value
    inc hero_moving

    OBJECT_ANIMATION hero, HERO_ANIMATION_RIGHT, HERO_ANIMATION_RATE_MOVING, hero_animation_right

    lda #<MOVE_DX
    sta hero + o::dx_lo
    lda #>MOVE_DX
    sta hero + o::dx_hi

    ; regularly "skip" (small jump) when moving
    lda frame_counter
    and #MOVE_SKIP_INTERVAL
    bne @joystick_fire

    ; "skip" if dy is 0
    lda hero + o::dy_lo
    ora hero + o::dy_hi
    bne @joystick_fire

    ; "skip" by a negative dy
    lda #<-MOVE_SKIP_VELOCITY
    sta hero + o::dy_lo
    lda #>-MOVE_SKIP_VELOCITY
    sta hero + o::dy_hi

@joystick_fire:
    ; is hero already jumping?
    lda hero_jumping
    bne @keyboard_return

    lda CIA1_PORT_A
    and #JOYSTICK_FIRE
    bne @keyboard_return    ; note: active low

    ; set negative dy to jump up
    lda #<-JUMP_VELOCITY
    sta hero + o::dy_lo
    lda #>-JUMP_VELOCITY
    sta hero + o::dy_hi

    ; flag hero is jumping and moving 
    lda #1
    sta hero_jumping
    sta hero_moving

@keyboard_return:
    ; if restarting skip this step
    lda hero_restarting
    bne @controls_done

    ; check if "return" key is pressed
    lda #KEYBOARD_ROW_0
    sta CIA1_PORT_A
    lda CIA1_PORT_B
    and #KEYBOARD_RETURN
    bne @controls_done      ; note: active low

    ; if infinities left
    lda hero_infinities
    beq @controls_done

    dec hero_infinities

    ; non-zero means "restarting"
    inc hero_restarting

    ; set restart position and velocity
    lda #<RESTART_X
    sta hero + o::x_lo
    lda #>RESTART_X
    sta hero + o::x_hi
    lda #<RESTART_Y 
    sta hero + o::y_lo
    lda #>RESTART_Y
    sta hero + o::y_hi
    lda #0
    sta hero + o::dx_lo
    sta hero + o::dx_hi
    sta hero + o::dy_lo
    sta hero + o::dy_hi

@controls_done:
    ; if hero is not moving animate idle
    lda hero_moving
    bne :+

    OBJECT_ANIMATION hero, HERO_ANIMATION_IDLE, HERO_ANIMATION_RATE_IDLE, hero_animation_idle

    ; apply gravity if hero is in a jump
    lda hero_jumping
    bne @gravity

    ; every n'th frame apply gravity for collision with floor detection
    inc frame_counter 
    ; note: best result when frame counter is increased here when interacting
    ;       with the move "skip" use of same variable
    lda frame_counter
    and #GRAVITY_INTERVAL
    beq @gravity

    ; check if dy is zero and skip gravity if so
    lda hero + o::dy_lo
    ora hero + o::dy_hi
    beq @gravity_done

@gravity:
    ; increase dy
    clc
    lda hero + o::dy_lo
    adc #GRAVITY
    sta hero + o::dy_lo
    lda hero + o::dy_hi 
    adc #0
    sta hero + o::dy_hi

@gravity_done:

@animation:
    ; animate hero
    OBJECT_ANIMATION_NEXT hero

@animation_done:

@hud:
    ; render hud lines
    HUD_BARS hero_pickables, HUD_PICKABLES_LINE 
    HUD_BARS hero_infinities, HUD_INFINITIES_LINE

    ; render progress bar

    ; get (approximate) number of dots in the line
    lda hero + o::x_hi
    ; shift to fit graph of 21 dots 
    lsr
    lsr
    lsr
    ; acc now contains number of dots in the progress line
    ; multiply by 3 bytes per sprite data row
    sta tmp1
    asl
    clc
    adc tmp1

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

    ; set border color to illustrate duration of this pass
    lda #BORDER_REFRESH
    sta VIC_BORDER

    ; update objects state
    OBJECT_UPDATE hero

    ; get world coordinate in pixels for x
    OBJECT_X_TO_WCS hero

    ; `tmp1` and `tmp2` now contains hero `x_lo`, `x_hi` pixels in world
    ; coordinates

    ; center camera on object with 16 pixels wide sprite
    CAMERA_CENTER_ON_X tmp1, -TILE_WIDTH

    ; place object sprite in screen coordinate system
    OBJECT_UPDATE_SPRITE hero, HERO_SPRITE_NUM, HERO_SPRITE_COLOR, tmp1

    ; copy sprites state to hardware registers
    ; .include "update_sprites_state.s"
    ;
    ; ; sprites state bits
    ; lda sprites_enable
    ; sta VIC_SPRITE_ENBL
    ; lda sprites_double_width
    ; sta VIC_SPRITE_DBLX
    ; lda sprites_double_height
    ; sta VIC_SPRITE_DBLY
    ; lda sprites_msb_x
    ; sta VIC_SPRITES_8X

;-------------------------------------------------------------------------------
render:
;-------------------------------------------------------------------------------

    ; note:
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

    ; set border color to illustrate duration of render
    lda #BORDER_RENDER
    sta VIC_BORDER

    ; convert camera 16 bit pixel position to tile map x and screen right offset
    lda camera_x_lo
    tax
    and #TILE_PIXEL_MASK    ; extract sub-tile screen offset (0-7)
    eor #TILE_PIXEL_MASK    ; start negation by inverting
    clc
    adc #1
    and #TILE_PIXEL_MASK    ; mask to 3 bits
    sta screen_offset       ; store screen shift right offset

    ; calculate tile map x: (camera_x_hi << 5) | (camera_x_lo >> 3) with
    ; adjustment if `screen_offset` != 0
    txa                     ; restore `camera_x_lo`
    .repeat TILE_SHIFT
        lsr
    .endrepeat
    sta tmp1                ; tmp1 = camera_x_lo >> 3
    lda camera_x_hi         ; get high byte
    .repeat 8 - TILE_SHIFT  ; note: 8 is number of bits in a byte
        asl
    .endrepeat
    ora tmp1                ; combine: (hi << 5) | (lo >> 3)
    ldx screen_offset       ; check if `screen_offset` is 0
    beq :+                  ; if 0, no adjustment needed
    clc                     ; clear unknown carry flag
    adc #1                  ; add 1 to match desired table values 
:   tax                     ; transfer to x used in `render_tile_map`

;-------------------------------------------------------------------------------
render_tile_map:
;-------------------------------------------------------------------------------

    ; note: register x contains tile map x
    ldy #0                  ; screen column start

    ; jump to unrolled loop for current screen
    lda screen_active
    beq @screen_0
    jmp @screen_1

@screen_0:
    ; generated unrolled loop using absolute indexed stores (avoids indirect)
    .include "render_to_screen_0.s"
    inx
    iny
    cpy #SCREEN_WIDTH
    beq @jmp_to_done
    jmp @screen_0
@jmp_to_done:
    jmp @done 

@screen_1:
    ; generated unrolled loop using absolute indexed stores (avoids indirect)
    .include "render_to_screen_1.s"
    inx
    iny
    cpy #SCREEN_WIDTH
    beq @done
    jmp @screen_1

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
objects_state:
;-------------------------------------------------------------------------------
.out .sprintf("objects_state: $%04x", objects_state)
hero:
    .byte <RESTART_X     ; x_lo
    .byte >RESTART_X     ; x_hi
    .byte <RESTART_Y     ; y_lo
    .byte >RESTART_Y     ; y_hi
    .byte 0              ; dx_lo
    .byte 0              ; dx_hi
    .byte 0              ; dy_lo
    .byte 0              ; dy_hi
    .byte HERO_SPRITE_IX ; sprite
    .byte 0              ; x_prv_lo
    .byte 0              ; x_prv_hi
    .byte 0              ; y_prv_lo
    .byte 0              ; y_prv_hi
    .byte HERO_ANIMATION_IDLE      ; n::id
    .byte 0                        ; n::frame
    .byte HERO_ANIMATION_RATE_IDLE ; n::rate
    .byte <hero_animation_idle     ; n::ptr
    .byte >hero_animation_idle     ;

;-------------------------------------------------------------------------------
.assert * <= $d000, error, "segment overflows into I/O"

;-------------------------------------------------------------------------------
hud_lines:
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
progress_lines:
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
hero_animation_idle:
;-------------------------------------------------------------------------------
.byte sprites_data / 64 + 8
.byte sprites_data / 64 + 9
.byte sprites_data / 64 + 10
.byte 0

;-------------------------------------------------------------------------------
hero_animation_right:
;-------------------------------------------------------------------------------
.byte sprites_data / 64 + 1
.byte sprites_data / 64 + 0
.byte 0

;-------------------------------------------------------------------------------
hero_animation_left:
;-------------------------------------------------------------------------------
.byte sprites_data / 64 + 3
.byte sprites_data / 64 + 2
.byte 0

;-------------------------------------------------------------------------------
.out .sprintf("   free bytes: %d", $d800 - *)
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; color ram
;-------------------------------------------------------------------------------
.assert * <= $d800, error, "segment overflows into COLOR_RAM"
.org $d800
.segment "COLOR_RAM"
color_ram:
.out .sprintf("    color_ram: $%04x", color_ram)
    .res 1000

