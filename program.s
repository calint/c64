.export start

VIC_CONTROL_X = $D016  ; vic-ii screen control register 2 (horizontal scroll)
SCREEN        = $0400  ; screen address
DELAY         = 8      ; scroll delay
SCROLL_X      = $FE    ; fine scroll of screen between 0 and 7
DELAY1        = $FD    ; delay outer loop
DELAY2        = $FC    ; delay inner loop
MAP_OFFSET_X  = $FB    ; map offset in characters

start:
    lda #7             ; start at rightmost offset
    sta SCROLL_X       ; store
    lda #0             ; start at leftmost map offset
    sta MAP_OFFSET_X   ; store

render_map:
    ldx MAP_OFFSET_X   ; load map offset
    ldy #0             ; load screen position

loop1:
    lda message, x     ; load next character
    beq scroll_left    ; done writing string
    sta SCREEN, y      ; store on screen
    inx                ; increase character position in string
    iny                ; increase screen position
    jmp loop1          ; loop until terminator

scroll_left:
    lda SCROLL_X       ; load fine scroll x
    cmp #255           ; has it rolled over?
    bne fine_scroll    ; no, fine scroll
    lda #7             ; yes, set to maximum right
    sta SCROLL_X       ; store
    inc MAP_OFFSET_X   ; scroll map left one character
    jmp render_map     ; draw map

fine_scroll:
    lda SCROLL_X       ; OR offset
    sta VIC_CONTROL_X  ; store to chip address
    dec SCROLL_X       ; decrease fine scroll by 1
    jsr delay          ; delay
    jmp scroll_left    ; scroll left

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

message:
        ; 8,5,12,12,15 (HELLO) 32 (SPACE) 23,15,18,12,4 (WORLD) 0 (terminator)
        .byte 32,32,32,32,32,32,8,5,12,12,15,32,23,15,18,12,4,32,32,32
        .byte 32,32,32,32,32,32,8,5,12,12,15,32,23,15,18,12,4,32,32,32
        .byte 32,32,32,32,32,32,8,5,12,12,15,32,23,15,18,12,4,32,32,32
        .byte 32,32,32,32,32,32,8,5,12,12,15,32,23,15,18,12,4,32,32,32
        .byte 32,32,32,32,32,32,8,5,12,12,15,32,23,15,18,12,4,32,32,32
        .byte 32,32,32,32,32,32,8,5,12,12,15,32,23,15,18,12,4,32,32,32
        .byte 0
