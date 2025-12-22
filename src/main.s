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
PROCESSOR_PORT  = $01       ; processor port address
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
ANIMATION_RATE_MOVING = %111
ANIMATION_RATE_IDLE = %11111

; initial infinities (respawns) hero has
INITIAL_INFINITIES = 7


;
; constants coupled with graphics
;

; tile id for pickable item
TILE_ID_PICKABLE = 33

; tile id for empty
TILE_ID_EMPTY = 32

; hero sprite data for use in register
HERO_SPRITE = sprites_data_0 >> 6

; sprite used for hud
HUD_SPRITE_DATA = sprites_data_47

; hud sprite data for use in register
HUD_SPRITE = HUD_SPRITE_DATA >> 6

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

; hero sprite bit for use in register
HERO_SPRITE_BIT = 1

; animation enumeration
HERO_ANIMATION_IDLE = 0
HERO_ANIMATION_RIGHT = 1
HERO_ANIMATION_LEFT = 2

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
hero_animation:        .res 1  ; 0 idle, 1 right, 2 left
hero_animation_ptr:    .res 2  ; pointer to base of animation frames 
hero_animation_rate:   .res 1  ; frame rate for current animation (AND = 0)
hero_animation_frame:  .res 1  ; frame number in animation
tmp1:                  .res 1  ; temporary
tmp2:                  .res 1  ; temporary
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
.endstruct

;-------------------------------------------------------------------------------
; sprite struct with short name `s` for code brevity
;-------------------------------------------------------------------------------
.struct s
    sx       .byte ; screen x lower 8 bits
    sy       .byte ; screen y
    data     .byte ; sprite data address / 64
    color    .byte ; color
.endstruct

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
    sta hero_animation_frame
    sta frame_counter
    sta hero_pickables
    lda #HERO_ANIMATION_IDLE
    sta hero_animation
    lda #ANIMATION_RATE_IDLE
    sta hero_animation_rate
    lda #<hero_animation_idle
    sta hero_animation_ptr
    lda #>hero_animation_idle
    sta hero_animation_ptr + 1
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
    and HERO_SPRITE_BIT
    beq @collision_reaction_done

    ; hero has collided with background, restore state to previous x,y and set
    ; dx, dy to 0

    lda hero + o::x_prv_lo
    sta hero + o::x_lo
    lda hero + o::x_prv_hi
    sta hero + o::x_hi
    lda hero + o::y_prv_lo
    sta hero + o::y_lo
    lda hero + o::y_prv_hi
    sta hero + o::y_hi

    lda #0
    ; note: `dx_lo` and `dx_hi` will be set to 0 in `@controls`
    sta hero + o::dy_lo
    sta hero + o::dy_hi

    ; stop the jump logic
    sta hero_jumping

    ; restart sequence done
    sta hero_restarting

@collision_reaction_done:

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
    ; done checking for pickables

@controls:
    ; set non horizontal movement
    lda #0
    sta hero + o::dx_lo 
    sta hero + o::dx_hi
    sta hero_moving

@left:
    ; joystick
    lda CIA1_PORT_A 
    and #JOYSTICK_LEFT
    bne @right              ; note: active low

    ; flag hero is moving, non-zero value means "moving"
    inc hero_moving

    ; if hero already animating "left" continue
    lda hero_animation
    cmp #HERO_ANIMATION_LEFT
    beq :+
    ; start animating "left"
    lda #HERO_ANIMATION_LEFT
    sta hero_animation
    lda #0
    sta hero_animation_frame
    ; set frame rate for "moving" animation
    lda #ANIMATION_RATE_MOVING
    sta hero_animation_rate
    lda #<hero_animation_left
    sta hero_animation_ptr
    lda #>hero_animation_left
    sta hero_animation_ptr + 1
    :

    lda #<-MOVE_DX
    sta hero + o::dx_lo
    lda #>-MOVE_DX
    sta hero + o::dx_hi

    ; regularly "skip" (small jump) when moving
    lda frame_counter
    and #MOVE_SKIP_INTERVAL
    bne @right

    ; "skip" if dy is 0
    lda hero + o::dy_lo
    ora hero + o::dy_hi
    bne @right

    ; "skip" by a negative dy
    lda #<-MOVE_SKIP_VELOCITY
    sta hero + o::dy_lo
    lda #>-MOVE_SKIP_VELOCITY
    sta hero + o::dy_hi

@right:
    lda CIA1_PORT_A 
    and #JOYSTICK_RIGHT
    bne @fire               ; note: active low

    ; flag hero is moving, non-zero value
    inc hero_moving

    ; if hero already animating "right" continue
    lda hero_animation
    cmp #HERO_ANIMATION_RIGHT
    beq :+
    ; start animating "right"
    lda #HERO_ANIMATION_RIGHT
    sta hero_animation
    lda #0
    sta hero_animation_frame
    ; set frame rate for "moving" animation
    lda #ANIMATION_RATE_MOVING
    sta hero_animation_rate
    lda #<hero_animation_right
    sta hero_animation_ptr
    lda #>hero_animation_right
    sta hero_animation_ptr + 1
    :

    lda #<MOVE_DX
    sta hero + o::dx_lo
    lda #>MOVE_DX
    sta hero + o::dx_hi

    ; regularly "skip" (small jump) when moving
    lda frame_counter
    and #MOVE_SKIP_INTERVAL
    bne @fire

    ; "skip" if dy is 0
    lda hero + o::dy_lo
    ora hero + o::dy_hi
    bne @fire

    ; "skip" by a negative dy
    lda #<-MOVE_SKIP_VELOCITY
    sta hero + o::dy_lo
    lda #>-MOVE_SKIP_VELOCITY
    sta hero + o::dy_hi

@fire:
    ; is hero already jumping?
    lda hero_jumping
    bne @key_return

    lda CIA1_PORT_A
    and #JOYSTICK_FIRE
    bne @key_return         ; note: active low

    ; set negative dy to jump up
    lda #<-JUMP_VELOCITY
    sta hero + o::dy_lo
    lda #>-JUMP_VELOCITY
    sta hero + o::dy_hi

    ; flag hero is jumping and moving 
    lda #1
    sta hero_jumping
    sta hero_moving

@key_return:
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

    ; if hero already idle continue animation
    lda hero_animation
    cmp #HERO_ANIMATION_IDLE
    beq :+

    ; start hero idle animation
    lda #HERO_ANIMATION_IDLE
    sta hero_animation
    lda #0
    sta hero_animation_frame
    lda #ANIMATION_RATE_IDLE
    sta hero_animation_rate
    lda #<hero_animation_idle
    sta hero_animation_ptr
    lda #>hero_animation_idle
    sta hero_animation_ptr + 1
    :

    ; apply gravity if hero is in a jump
    lda hero_jumping
    bne @gravity_apply

    ; every n'th frame apply gravity for collision with floor detection
    inc frame_counter 
    ; note: best result when frame counter is increased here when interacting
    ;       with the move "skip" use of same variable
    lda frame_counter
    and #GRAVITY_INTERVAL
    beq @gravity_apply

    ; check if dy is zero and skip gravity if so
    lda hero + o::dy_lo
    ora hero + o::dy_hi
    beq @gravity_done

@gravity_apply:
    ; increase dy
    clc
    lda hero + o::dy_lo
    adc #GRAVITY
    sta hero + o::dy_lo
    lda hero + o::dy_hi 
    adc #0
    sta hero + o::dy_hi

@gravity_done:

@render_hud:
    ; render pickables count
    lda hero_pickables
    ldy #HUD_PICKABLES_LINE * 3 + 1    ; 3 bytes per row, second byte
    jsr @draw_hud_bytes

    ; render infinities count
    lda hero_infinities
    ldy #HUD_INFINITIES_LINE * 3 + 1   ; 3 bytes per row, second byte
    jsr @draw_hud_bytes

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

    jmp @hud_done

@draw_hud_bytes:
    asl                     ; multiply by 2 to get index into `hud_lines`
    tax                     ; x now holds the base index for the 2-byte pattern

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
    rts

@hud_done:

@animation:
@animation_hero:
    lda frame_counter
    and hero_animation_rate
    bne @animation_done

    ldy hero_animation_frame
    lda (hero_animation_ptr), y
    bne :+
    ; last frame, loop back
    lda #0
    sta hero_animation_frame
    tay
    lda (hero_animation_ptr), y
:   sta hero + o::sprite
    inc hero_animation_frame

@animation_done:

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

    ; save current state to previous
    lda hero + o::x_lo
    sta hero + o::x_prv_lo
    lda hero + o::x_hi
    sta hero + o::x_prv_hi
    lda hero + o::y_lo
    sta hero + o::y_prv_lo
    lda hero + o::y_hi
    sta hero + o::y_prv_hi

    ; add dx to x
    clc
    lda hero + o::x_lo
    adc hero + o::dx_lo
    sta hero + o::x_lo
    lda hero + o::x_hi
    adc hero + o::dx_hi
    sta hero + o::x_hi

    ; add dy to y
    clc
    lda hero + o::y_lo
    adc hero + o::dy_lo
    sta hero + o::y_lo
    lda hero + o::y_hi
    adc hero + o::dy_hi
    sta hero + o::y_hi

    ; update sprite data index
    lda hero + o::sprite
    sta sprite_hero + s::data

    ; center camera on hero

    ; make hero x to `tmp1` (x lo) and `tmp2` (x hi) in world pixel coordinates
    ; signed arithmetic shift right across 16 bits
    lda hero + o::x_lo
    sta tmp1
    lda hero + o::x_hi
    .repeat SUBPIXEL_SHIFT
        cmp #$80            ; sets carry bit if negative preserving sign
        ror
        ror tmp1
    .endrepeat
    sta tmp2

    ; `tmp1` and `tmp2` now contains hero `x_lo`, `x_hi` pixels in world
    ; coordinates

    ; center camera on object with 16 pixels wide sprite
    sec
    lda tmp1
    sbc #SCREEN_WIDTH_PX / 2 - TILE_WIDTH
    sta camera_x_lo
    lda tmp2
    sbc #0
    sta camera_x_hi

    ; place object in camera coordinate system
 
    ; put object coordinates on screen by subtracting camera x position
    sec
    lda tmp1
    sbc camera_x_lo
    sta tmp1
    lda tmp2
    sbc camera_x_hi
    sta tmp2

    ; add left border (40-column display)
    clc
    lda tmp1
    adc #SCREEN_BRDR_LFT
    sta tmp1
    lda tmp2
    adc #0
    sta tmp2

    ; update hero sprite position

    ; update hero sprite x position
    lda tmp1                    ; x low
    sta sprite_hero + s::sx

    ; set hero sprite x 9'th bit if x (`tmp1`, `tmp2`) is greater than 256
    lda sprites_msb_x
    and #<~HERO_SPRITE_BIT  ; mask out hero sprite bit
    ldx tmp2                ; check if `tmp2` is zero
    beq :+
    ora #HERO_SPRITE_BIT    ; set hero sprite x 9'th bit
:   sta sprites_msb_x

    ; update hero sprite y position

    ; remove subpixels and compose y into `tmp1`
    lda hero + o::y_lo
    .repeat SUBPIXEL_SHIFT
        lsr
    .endrepeat
    sta tmp1                ; low bits in screen coordinates
    lda hero + o::y_hi
    .repeat SUBPIXEL_SHIFT
        asl
    .endrepeat
    ora tmp1
    ; accumulator now contains y with 0 being at top of screen within border

    ; add top border (25 rows display)
    clc
    adc #SCREEN_BRDR_TOP
    sta sprite_hero + s::sy

    ;
    ; update sprite hardware
    ;

    ; 8 sprites
    .include "update_sprites_state.s"

    ; sprites state bits
    lda sprites_enable
    sta VIC_SPRITE_ENBL
    lda sprites_double_width
    sta VIC_SPRITE_DBLX
    lda sprites_double_height
    sta VIC_SPRITE_DBLY
    lda sprites_msb_x
    sta VIC_SPRITES_8X

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
sprites_state:
;-------------------------------------------------------------------------------
.out .sprintf("sprites_state: $%04x", sprites_state)
    ;       x,   y,               data, color
sprite_hero:
    .byte   0,   0,        HERO_SPRITE, COLOR_WHITE
    .byte   0,   0, sprites_data_16>>6, COLOR_GREY_1
    .byte 138, 150, sprites_data_17>>6, 4
    .byte 162, 150, sprites_data_18>>6, 5
    .byte 186, 150, sprites_data_19>>6, 6
    .byte 234, 150, sprites_data_20>>6, 7
    .byte   2, 150, sprites_data_21>>6, 8
sprite_hud:
    .byte  54,  51,         HUD_SPRITE, COLOR_WHITE
sprites_msb_x: ; 9'th bit of x-coordinate
    .byte %11000000
sprites_enable:
    .byte %10000001
sprites_double_width:
    .byte %00000000
sprites_double_height:
    .byte %00000000

;-------------------------------------------------------------------------------
.align 8
objects_state:
;-------------------------------------------------------------------------------
.out .sprintf("objects_state: $%04x", objects_state)
    ;            xlo,        xhi,        ylo,        yhi, dxlo, dxhi, dylo, dyhi,      sprite, xprvlo, xprvhi, yprvlo, yprvhi
hero:
    .byte <RESTART_X, >RESTART_X, <RESTART_Y, >RESTART_Y,    0,    0,    0,    0, HERO_SPRITE,      0,      0,      0,      0


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

