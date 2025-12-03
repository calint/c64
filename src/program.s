; constants
VIC_CONTROL_X   = $D016     ; vic-ii screen control register 2
VIC_CONTROL_Y   = $D011     ; Screen Control Register 1 (Rows/Display Enable)
VIC_MEM_CTRL    = $D018     ; VIC-II Memory Control Register (Screen Base Address)
SCREEN_ADDRESS  = $0400     ; screen addreoss
SCREEN_WIDTH    = 40        ; screen width in characters
SCREEN_HEIGHT   = 25        ; screen height in characters
DELAY           = 255       ; scroll delay
VIC_CHAR_BASE   = $20       ; Character ROM is typically $D000, which is $10 << 4.
SCREEN_BUFFER1  = $0400     ; Buffer 1 Base Address (Default C64 screen)
SCREEN_BUFFER2  = $1000     ; Buffer 2 Base Address (Off-screen buffer)
VM_BUFFER1_VAL  = $01       ; D018 value for $0400 (VM bits D3-D0)
VM_BUFFER2_VAL  = $04       ; D018 value for $1000 (VM bits D3-D0)

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
SCREEN_BUFFER_ACTIVE = $F3       ; 0 or 1 depending if $0400 or SCREEN_BUFFER2

.export start
start:
    lda #7                  ; start at rightmost offset
    sta SCROLL_X            ; store
    lda #0                  ; start at leftmost map offset
    sta MAP_OFFSET_X        ; store
    sta SCREEN_BUFFER_ACTIVE
    lda #<tile_map          ; Load low byte of tile_map address
    sta TILE_MAP_BASE       ; Store to ZP location $F9
    lda #>tile_map          ; Load high byte of tile_map address
    sta TILE_MAP_BASE+1     ; Store to ZP location $FA

render_tile_map:
    ; set screen pointer to $0400
    lda #$04
    sta SCREEN_PTR+1
    lda #$00
    sta SCREEN_PTR

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

scroll_left:
    lda SCROLL_X            ; load fine scroll x
    cmp #255                ; has it rolled over?
    bne fine_scroll         ; no, fine scroll
    lda #7                  ; yes, set to maximum right
    sta SCROLL_X
    sta VIC_CONTROL_X
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

;-------------------------------------------------------------------------------
setup_buffers:
    lda SCREEN_BUFFER_ACTIVE
    beq setup_buffer_1

    lda #<SCREEN_BUFFER2
    sta SCREEN_PTR
    lda #>SCREEN_BUFFER2
    sta SCREEN_PTR+1
    rts

setup_buffer_1:
    lda #<SCREEN_BUFFER1
    sta SCREEN_PTR
    lda #>SCREEN_BUFFER1
    sta SCREEN_PTR+1
    rts
;-------------------------------------------------------------------------------
switch_buffers:
    lda SCREEN_BUFFER_ACTIVE
    beq switch_buffers_1

    ; Set $D018 to show Buffer 1 ($0400)
    lda #VIC_CHAR_BASE | VM_BUFFER1_VAL
    sta VIC_MEM_CTRL
    lda #1
    sta SCREEN_BUFFER_ACTIVE
    rts

switch_buffers_1:
    ; Set $D018 to show Buffer 2 ($1000)
    lda #VIC_CHAR_BASE | VM_BUFFER2_VAL
    sta VIC_MEM_CTRL
    lda #0
    sta SCREEN_BUFFER_ACTIVE  
    rts
;-------------------------------------------------------------------------------

;SCREEN_BUFFER2:
;.res SCREEN_WIDTH * SCREEN_HEIGHT

.align $100         ; make 256 tiles row accessed by the lower byte 
tile_map:
    .include "../resources/tile_map.s"
