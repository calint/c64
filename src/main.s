;-------------------------------------------------------------------------------
; mapped memory
;-------------------------------------------------------------------------------
; 0x0002 - 0x00ff: zero page
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
VIC_BORDER      = $d020     ; vic-ii border color register
VIC_SPRITE_COLR = $d027     ; vic-ii 8 sprite colors
VIC_SPR_SPR_COL = $d01e     ; vic-ii sprite vs sprite collision bits
VIC_SPR_BG_COL  = $d01f     ; vic-ii sprite vs background collision bits
VIC_DATA_PORT_A = $dc00     ; joystick 2
VIC_DATA_PORT_B = $dc01     ; joystick 1
SID_V1_FREQ_LO  = $d400
SID_V1_FREQ_HI  = $d401
SID_V1_CTRL     = $d404
SID_V1_AD       = $d405
SID_V1_SR       = $d406
SID_MODE_VOL    = $d418
SPRITE_IX_OFST  = $03f8     ; sprite data index table offset from screen address
SCREEN_0_D018   = %00011000 ; screen at $0400 char map at $2000
SCREEN_1_D018   = %11111000 ; screen at $3c00 char map at $2000 
SCREEN_WIDTH    = 40        ; screen width in characters
SCREEN_HEIGHT   = 25        ; screen height in characters
SCREEN_BRDR_LFT = 24     ; x of first visible pixel
SCREEN_BRDR_TOP = 50      ; y of first visible pixel
TILE_MAP_WIDTH  = 256       ; number of horizontal tiles
BORDER_COLOR    = COLOR_BLUE
BORDER_RENDER   = COLOR_LHT_BLUE
BORDER_UPDATE   = COLOR_RED
BORDER_REFRESH  = COLOR_YELLOW 
RASTER_BORDER   = 251       ; raster value below bottom border (PAL)
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

;
; application
;

; maving velocity to left and right
MOVE_DX_LO = 8

; when moving, hero makes a "skip" (a small jump) at interval (AND is 0)
MOVE_SKIP_INTERVAL = %1111

; amount of dy when hero "skips" while moving
MOVE_SKIP_VELOCITY = 20

; initial velocity upwards when jumping
JUMP_VELOCITY_LO = 33

; gravity as pixels + fraction to add to velocity every frame
GRAVITY = 3

; gravity applied when hero is not jumping at interval (AND is 0)
GRAVITY_INTERVAL = %1111

; tile id for pickable item
TILE_ID_PICKABLE = 33

; tile id for empty
TILE_ID_EMPTY = 32

; y position when restarting including sub-pixels
;RESTART_Y_LO = ((10 * 8) << 4) & $ff
;RESTART_Y_HI = (10 * 8) >> 4
RESTART_X_LO = (4 << 4) & $ff
RESTART_X_HI = (4 >> 4)
RESTART_Y_LO = 0
RESTART_Y_HI = $ff

; animation frame time interval (AND is 0)
ANIMATION_RATE_MOVING = %111
ANIMATION_RATE_IDLE = %11111

; animation enumeration
ANIMATE_IDLE = 0
ANIMATE_RIGHT = 1
ANIMATE_LEFT = 2

;-------------------------------------------------------------------------------
; zero page
;-------------------------------------------------------------------------------
.org $0002
.segment "ZERO_PAGE"
zero_page:
.out .sprintf("    zero_page: $%04X", zero_page)
camera_x_lo:          .res 1  ; low byte of camera x
camera_x_hi:          .res 1  ; high byte of camera x
tile_map_x:           .res 1  ; tile map x offset in characters
screen_offset:        .res 1  ; number of pixels (0-7) screen is shifted right
screen_active:        .res 1  ; active screen (0 or 1)
frame_counter:        .res 1  ; frame counter used for AND = 0 intervals
hero_jumping:         .res 1  ; 1 if in jump
hero_moving:          .res 1  ; 0 if hero is idle
hero_animation:       .res 1  ; 0 idle, 1 right, 2 left
hero_animation_frame: .res 1  ; frame number in animation
hero_animation_ptr:   .res 2  ; pointer to base of animation frames 
hero_animation_rate:  .res 1  ; frame rate for current animation (AND = 0)
hero_pickables:       .res 1  ; number of picked items
hero_infinities:      .res 1  ; number of restarts remaining
hero_restarting:      .res 1  ; 1 when restarting sequence
tmp1:                 .res 1  ; temporary
tmp2:                 .res 1  ; temporary
ptr1:                 .res 2  ; temporary pointer

;-------------------------------------------------------------------------------
; program header
;-------------------------------------------------------------------------------
.org $0000
.segment "HEADER"
header:
.word $0801                ; prg load address hard-coded

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
    .include "charset_2.s"

;-------------------------------------------------------------------------------
; charset 3 (can be modified)
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
    .include "sprites_data.s"

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
    .include "tile_map.s"

;-------------------------------------------------------------------------------
; program
;-------------------------------------------------------------------------------
.assert * <= $5900, error, "segment overflows into CODE"
.org $5900
.segment "CODE"
program:
.out .sprintf("      program: $%04X", program)
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
    sprite   .byte ; address / 64 pointing to sprite data
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
    data     .byte ; address / 64 pointing to sprite data
    color    .byte ; color
.endstruct

;-------------------------------------------------------------------------------

    sei                     ; disable interrupts

    ; ; initialize stack
    ; ldx $ff                 ; low byte of stack
    ; txs                     ; high byte of stack is $01
    ;
    ; cld                     ; clear decimal mode
    ;
    ; note: not really necessary since initialized at boot by kernal

    ; setup memory mode ram visible at $a000-$bfff and $e000-$ffff
    lda #%00110101          ; see https://sta.c64.org/cbm64mem.html
    sta $01

    ;
    ; initialize sound
    ;

    ; set waveform to triangle (closest to sine)
    lda #$11                ; triangle wave + gate bit
    sta SID_V1_CTRL
 
    ; set adsr (attack/decay/sustain/release)
    lda #$00                ; fast attack, fast decay
    sta SID_V1_AD
    lda #$ff                ; max sustain, max release
    sta SID_V1_SR

    ; set volume to maximum
    lda #$0f                ; volume 15
    sta SID_MODE_VOL

    ; lda #$12
    ; sta SID_V1_FREQ_LO
    ; lda #$01
    ; sta SID_V1_FREQ_HI
    ;
    ; lda #$23
    ; sta SID_V1_FREQ_LO
    ; lda #$02
    ; sta SID_V1_FREQ_HI

    ;
    ; setup first render
    ;

    lda #0
    sta tile_map_x
    sta camera_x_lo
    sta camera_x_hi
    sta screen_active
    sta hero_jumping
    sta hero_moving
    sta hero_animation
    sta hero_animation_frame
    sta frame_counter
    sta hero_pickables
    lda #ANIMATION_RATE_IDLE
    sta hero_animation_rate
    lda #<hero_animation_idle
    sta hero_animation_ptr
    lda #>hero_animation_idle
    sta hero_animation_ptr + 1
    lda #7
    sta hero_infinities

    ; set background
    lda #COLOR_BLACK
    sta VIC_BG_COLOR

    ; set all color ram to white
    lda #COLOR_WHITE
    ldx #0                  ; initialize index
 :  sta color_ram+$000,x    ; color ram starts at $d800
    sta color_ram+$100,x    ; continue through
    sta color_ram+$200,x    ; all 1000 bytes
    sta color_ram+$300,x    ; of color memory
    inx
    bne :-                  ; loop until x wraps to 0

    ; fallthrough

;-------------------------------------------------------------------------------
main_loop:
;-------------------------------------------------------------------------------

    ; wait for vblank at lower border
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
    ;ora #%1000             ; enable 40 columns
    sta VIC_CTRL_2

;-------------------------------------------------------------------------------
update:
;-------------------------------------------------------------------------------
    ; note: previous x and y for objects are saved at `refresh`
    ;       state must be consistent when `udpate` is done 
 
    ; give visual for number of scan lines `update` uses
    lda #BORDER_UPDATE
    sta VIC_BORDER

    ; check if sprite 0 has collided with background
    lda VIC_SPR_BG_COL
    and #%00000001
    beq @collision_reaction_done

    ; sprite has collided with background, restore state previous x,y and set
    ; dx, dy to 0

    lda hero + o::x_prv_lo
    sta hero + o::x_lo
    lda hero + o::x_prv_hi
    sta hero + o::x_hi
    lda hero + o::y_prv_lo
    sta hero + o::y_lo
    lda hero + o::y_prv_hi
    sta hero + o::y_hi

    ; ; half the dx, dy
    ; ; note: this would be nicer but it does not work for now
    ; lda hero + 5   ; dx high
    ; cmp #$80
    ; ror hero + 5   ; dx high
    ; ror hero + 4   ; dx low
    ; lda hero + 7   ; dy high
    ; cmp #$80
    ; ror hero + 7   ; dy high
    ; ror hero + 6   ; dy low

    lda #0
    ; note: `dx_lo`` and `dx_hi` are set to 0 in `@controls`
    sta hero + o::dy_lo
    sta hero + o::dy_hi

    ; stop the jump logic
    sta hero_jumping

    ; restart sequence done
    sta hero_restarting

@collision_reaction_done:
    ; convert hero world x, y to tile map coordinates
    ; round to nearest tile by adding half of a tile times fraction (4 * 16)
    lda hero + o::x_lo
    clc
    adc #4 * 16
    ror                     ; shift with carry from addition
    lsr
    lsr
    lsr
    lsr
    lsr
    lsr
    sta tmp1
    lda hero + o::x_hi
    asl
    ora tmp1
    ; acc now contains tile x
    tay

    lda hero + o::y_lo
    clc
    adc #4 * 16
    ror
    lsr
    lsr
    lsr
    lsr
    lsr
    lsr
    sta tmp1
    lda hero + o::y_hi
    asl
    ora tmp1
    ; acc now contains tile y

    ; add it to row pointer
    clc
    adc #>tile_map
    sta ptr1 + 1
    ; base of column, always 0
    lda #<tile_map
    sta ptr1

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
    lda #0
    sta hero + o::dx_lo 
    sta hero + o::dx_hi
    sta hero_moving

@left:
    ; joystick
    lda VIC_DATA_PORT_A 
    and #JOYSTICK_LEFT
    bne @right

    lda #1
    sta hero_moving

    ; if hero already animating "left" continue
    lda hero_animation
    cmp #ANIMATE_LEFT
    beq :+
    ; start animating "left"
    lda #ANIMATE_LEFT
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

    lda #256 - MOVE_DX_LO
    sta hero + o::dx_lo
    lda #$ff
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
    lda #256 - MOVE_SKIP_VELOCITY
    sta hero + o::dy_lo
    lda #$ff
    sta hero + o::dy_hi

@right:
    lda VIC_DATA_PORT_A 
    and #JOYSTICK_RIGHT
    bne @fire

    lda #1
    sta hero_moving

    ; if hero already animating "right" continue
    lda hero_animation
    cmp #ANIMATE_RIGHT
    beq :+
    ; start animating "right"
    lda #ANIMATE_RIGHT
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

    lda #MOVE_DX_LO
    sta hero + o::dx_lo
    lda #0
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
    lda #256 - MOVE_SKIP_VELOCITY
    sta hero + o::dy_lo
    lda #$ff
    sta hero + o::dy_hi

@fire:
    ; is hero already jumping?
    lda hero_jumping
    bne @key_return

    lda VIC_DATA_PORT_A
    and #JOYSTICK_FIRE
    bne @key_return

    ; set negative dy to jump up
    lda #256 - JUMP_VELOCITY_LO
    sta hero + o::dy_lo
    lda #$ff
    sta hero + o::dy_hi

    ; flag for hero is in a jump
    lda #1
    sta hero_jumping
    sta hero_moving

@key_return:
    ; if restarting skip this step
    lda hero_restarting
    bne @controls_done

    lda #$fe       ; set row 0 (invert bit 0)
    sta VIC_DATA_PORT_A
    lda VIC_DATA_PORT_B
    and #2
    bne @controls_done

    lda #1
    sta hero_restarting

    ; if infinities left
    lda hero_infinities
    beq @controls_done

    dec hero_infinities

    ; set restart position
    lda #RESTART_X_LO
    sta hero + o::x_lo
    lda #RESTART_X_HI
    sta hero + o::x_hi
    lda #0
    sta hero + o::dx_lo
    sta hero + o::dx_hi
    sta hero + o::dy_lo
    sta hero + o::dy_hi
    lda #RESTART_Y_LO 
    sta hero + o::y_lo
    lda #RESTART_Y_HI
    sta hero + o::y_hi

@controls_done:
    ; if hero is not moving animate idle
    lda hero_moving
    bne :+
    ; if hero already idle continue animation
    lda hero_animation
    cmp #ANIMATE_IDLE
    beq :+
    ; start hero idle animation
    lda #ANIMATE_IDLE
    sta hero_animation
    sta hero_animation_frame  ; note: ANIMATE_IDLE == 0
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
    ldy #3 * 3 + 1          ; start row 3, second byte
    jsr @draw_hud_bytes

    ; render infinities count
    lda hero_infinities
    ldy #11 * 3 + 1         ; start row 11, second byte
    jsr @draw_hud_bytes

    ; render progress bar

    ; get (approximate) number of dots in the line
    lda hero + o::x_hi
    ; shift to fit graph of 21 dots 
    lsr
    lsr
    lsr
    ; acc now contains number of dots in the progress line
    ; multiply by 3 bytes per row
    sta tmp1
    asl
    clc
    adc tmp1
    ; render on sprite
    tax
    ldy #18 * 3             ; start at row 18, first byte
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

    jmp @hud_done           ; or next part of your code

@draw_hud_bytes:
    asl                     ; multiply value by 2
    sta tmp1                ; store base index for hud_lines
    ldx #4                  ; loop for 5 rows
@row_loop:
    stx tmp2                ; save row counter
    ldx tmp1                ; get hud_lines index
    lda hud_lines, x        ; load pattern byte 1
    sta sprites_data_47, y  ; store in sprite
    inx                     ; next hud byte
    iny                     ; next sprite byte
    lda hud_lines, x        ; load pattern byte 2
    sta sprites_data_47, y  ; store in sprite
 
    ; advance y to the second byte of the next row
    iny
    iny
 
    ldx tmp2                ; restore row counter
    dex
    bpl @row_loop
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

    lda hero + o::sprite
    sta sprite_hero + s::data

    ; center camera on hero
    ; todo: move this to "user" code
    ; make hero x to tmp1 (x lo) and tmp2 (x hi) in world pixel coordinates
    lda hero + o::x_lo
    ; remove pixel fraction
    lsr
    lsr
    lsr
    lsr
    sta tmp1
    lda hero + o::x_hi
    tax                     ; save for later use
    ; make room for 4 bits from tmp1
    asl
    asl
    asl
    asl
    ; or the 4 lowest high bits
    ora tmp1
    sta camera_x_lo
    sta tmp1
    txa                     ; restore hero x_hi
    ; remove the "ored" 4 lowest bits
    lsr
    lsr
    lsr
    lsr
    sta camera_x_hi
    sta tmp2
    ; tmp1 and tmp2 now contains x_lo, x_hi

    ; center camera on object with 16 pixels wide sprite
    sec
    lda camera_x_lo
    sbc #320/2-8            ; 320 screen width, -8 to move to center of sprite
    sta camera_x_lo
    lda camera_x_hi
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
    adc #SCREEN_BRDR_LFT    ; left border
    sta tmp1
    lda tmp2
    adc #0
    sta tmp2

    ; update sprite position

    ; update sprite x position
    lda tmp1                    ; x low
    sta sprite_hero + s::sx

    ; set sprite 0 9'th bit if x (tmp1, tmp2) is greater than 256 
    lda sprites_msb_x       ; msb on
    and #%11111110
    ldx tmp2                ; check if tmp2 is zero
    beq :+                  ; note: see .byte $2c trick to skip 2 bytes
    ora #%00000001          ; set sprite 0 x 9'th bit
:   sta sprites_msb_x

    ; update sprite y position
    lda hero + o::y_lo
    lsr
    lsr
    lsr
    lsr
    sta tmp1                ; low bits in screen coordinates
    lda hero + o::y_hi
    asl
    asl
    asl
    asl
    ora tmp1
    ; add top border (25 rows display)
    ; note: map object to coordinates of tile map
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

    ; fallthrough

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

    ; convert camera 16 bit pixel position to tile map x and screen right shift
    lda camera_x_lo         ; camera position low byte
    tax                     ; store in x for later use 
    and #%00000111          ; get lower 3 bits
    eor #%00000111          ; invert
    clc                     ; clear unknown carry flag state
    adc #1                  ; add 1
    and #%00000111          ; mask to 3 bits
    sta screen_offset       ; store screen shift right offset
    tay                     ; store in y for later use

    ; calculate tile_map_x: (camera_x_hi << 5) | (camera_x_lo >> 3)
    ; with adjustment if screen_offset != 0
    txa                     ; restore camera_x_lo
    lsr                     ; shift right by 3 bits
    lsr
    lsr
    sta tmp1                ; tmp1 = camera_x_lo >> 3
    lda camera_x_hi         ; get high byte
    asl                     ; shift left by 5 bits 
    asl
    asl
    asl
    asl
    ora tmp1                ; combine: (hi << 5) | (lo >> 3)
    ldx screen_offset       ; check if screen_offset is 0
    beq :+                  ; if 0, no adjustment needed
    clc                     ; clear unknown carry flag
    adc #1                  ; add 1 to match desired table values 
:   sta tile_map_x          ; update tile_map_x

    ; fallthrough

;-------------------------------------------------------------------------------
render_tile_map:
;-------------------------------------------------------------------------------

    ; initiate tile map position and screen column
    ldx tile_map_x          ; tile map left edge
    ldy #0                  ; screen column start

    ; jump to unrolled loop for current screen
    lda screen_active
    beq @screen_0
    jmp @screen_1

@screen_0:
    ; generated unrolled loop with cheaper absolute indexing
    .include "render_to_screen_0.s"
    inx
    iny
    cpy #SCREEN_WIDTH
    beq @jmp_to_done
    jmp @screen_0
@jmp_to_done:
    jmp @done 

@screen_1:
    ; generated unrolled loop with cheaper absolute indexing
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
.align 8
sprites_state:
;-------------------------------------------------------------------------------
.out .sprintf("sprites_state: $%04X", sprites_state)
    ;       x,   y,               data, color
sprite_hero: ; hero is composed of 2 sprites
    .byte   0,   0, sprites_data_0 >>6, COLOR_WHITE
    .byte   0,   0, sprites_data_1 >>6, COLOR_GREY_1
    .byte 138, 150, sprites_data_3 >>6, 4
    .byte 162, 150, sprites_data_4 >>6, 5
    .byte 186, 150, sprites_data_5 >>6, 6
    .byte 234, 150, sprites_data_6 >>6, 7
    .byte   2, 150, sprites_data_7 >>6, 8
sprite_hud:
    .byte  54,  51, sprites_data_47>>6, COLOR_WHITE
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
.out .sprintf("objects_state: $%04X", objects_state)
    ;            xlo,  xhi, ylo, yhi, dxlo, dxhi, dylo, dyhi,            sprite, xprvlo, xprvhi, yprvlo, yprvhi
hero:
    .byte   4<<4&$ff, 4>>4,   0, $ff,    0,    0,    0,    0, sprites_data_0>>6,      0,      0,      0,      0


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
.byte (sprites_data + 64 *  8) / 64
.byte (sprites_data + 64 *  9) / 64
.byte (sprites_data + 64 * 10) / 64
.byte 0

;-------------------------------------------------------------------------------
hero_animation_right:
;-------------------------------------------------------------------------------
.byte (sprites_data + 64 * 1) / 64
.byte (sprites_data + 64 * 0) / 64
.byte 0

;-------------------------------------------------------------------------------
hero_animation_left:
;-------------------------------------------------------------------------------
.byte (sprites_data + 64 * 3) / 64
.byte (sprites_data + 64 * 2) / 64
.byte 0

;-------------------------------------------------------------------------------
.out .sprintf("   free bytes: %d", $d800 - *)
;-------------------------------------------------------------------------------
; color ram
;-------------------------------------------------------------------------------
.assert * <= $d800, error, "segment overflows into COLOR_RAM"
.org $d800
.segment "COLOR_RAM"
color_ram:
.out .sprintf("    color_ram: $%04X", color_ram)
    .res 1000

