.export start

VIC_CONTROL_X = $D016  ; VIC-II Screen Control Register 2 (Horizontal Scroll)
SCREEN        = $0400  ; screen address
SCROLL_X      = $FE
DELAY1        = $FD
DELAY2        = $FC
MAP_OFFSET_X  = $FB

start:
    lda #7
    sta SCROLL_X
    lda #0
    sta MAP_OFFSET_X

print_screen:
    ldx MAP_OFFSET_X
    ldy #0

loop1:
    lda message, x
    beq scroll_left
    sta SCREEN, y
    inx
    iny
    jmp loop1

scroll_left:
    lda SCROLL_X
    cmp #255
    bne fine_scroll
    lda #7
    sta SCROLL_X
    inc MAP_OFFSET_X
    jmp print_screen

fine_scroll:
    lda VIC_CONTROL_X
    and #%11111000
    ora SCROLL_X
    sta VIC_CONTROL_X
    dec SCROLL_X
    jsr delay
    jmp scroll_left

delay:
    lda #0
    sta DELAY1
    sta DELAY2
delay1:
    dec DELAY1
    bne delay1
    dec DELAY2
    bne delay1
    rts

message:
        ; 8,5,12,12,15 (HELLO) 32 (SPACE) 23,15,18,12,4 (WORLD) 0 (terminator)
        .byte 32,32,32,8,5,12,12,15,32,23,15,18,12,4,32,32,32,0
