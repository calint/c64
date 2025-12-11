; generated code, do not edit
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
