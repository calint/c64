.export start

VIC_CONTROL_X = $D016  ; VIC-II Screen Control Register 2 (Horizontal Scroll)
SCROLL_VAL    = $FE    ; Use $FE for our Page Zero variable
SCREEN        = $0400  ; screen address

start:
    lda #$00
    sta SCROLL_VAL

    ldx #$00           ; index into string
loop1:
    lda message, x
    beq scroll         ; message ends with a 0-byte
    sta SCREEN, x      ; copy character code to screen memory ($0400 is the default)
    inx
    jmp loop1

scroll:
    lda SCROLL_VAL
    cmp #$08           ; check if it has reached 8 (finished the 8-pixel cycle)
    bne fine_scroll    ; if not 8, do fine scrolling
    lda #$00
    sta SCROLL_VAL

fine_scroll:
    lda VIC_CONTROL_X  ; Load current VIC-II control bits (e.g., 40-column mode)
    and #%11111000     ; Mask off the old scroll value (bits 0, 1, 2)
    ora SCROLL_VAL     ; OR with the new value from Page Zero (0-7)
    sta VIC_CONTROL_X  ; Set the new scroll position
    inc SCROLL_VAL     ; Increment $FE
    jsr delay
    jmp loop1          ; Jump to the waiting loop (to simulate a delay or frame wait)

delay:
    ldx #0
    ldy #0
delay1:
    dex
    bne delay1
    dey
    bne delay1
    rts

message:
        ; 8,5,12,12,15 (HELLO) 32 (SPACE) 23,15,18,12,4 (WORLD) 0 (terminator)
        .byte 8,5,12,12,15,32,23,15,18,12,4,0
