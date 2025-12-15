    ;
    ; generated code, do not edit
    ;
    ; sprite 0
    lda sprites_state + s::sx
    sta VIC_SPRITE_0_X
    lda sprites_state + s::sy
    sta VIC_SPRITE_0_Y
    lda sprites_state + s::data
    sta screen_0 + SPRITE_IX_OFST + 0
    sta screen_1 + SPRITE_IX_OFST + 0
    lda sprites_state + s::color
    sta VIC_SPRITE_COLR + 0

    ; sprite 1
    lda sprites_state + s::sx
    sta VIC_SPRITE_1_X
    lda sprites_state + s::sy
    sta VIC_SPRITE_1_Y
    lda sprites_state + s::data
    sta screen_0 + SPRITE_IX_OFST + 1
    sta screen_1 + SPRITE_IX_OFST + 1
    lda sprites_state + s::color
    sta VIC_SPRITE_COLR + 1

    ; sprite 2
    lda sprites_state + s::sx
    sta VIC_SPRITE_2_X
    lda sprites_state + s::sy
    sta VIC_SPRITE_2_Y
    lda sprites_state + s::data
    sta screen_0 + SPRITE_IX_OFST + 2
    sta screen_1 + SPRITE_IX_OFST + 2
    lda sprites_state + s::color
    sta VIC_SPRITE_COLR + 2

    ; sprite 3
    lda sprites_state + s::sx
    sta VIC_SPRITE_3_X
    lda sprites_state + s::sy
    sta VIC_SPRITE_3_Y
    lda sprites_state + s::data
    sta screen_0 + SPRITE_IX_OFST + 3
    sta screen_1 + SPRITE_IX_OFST + 3
    lda sprites_state + s::color
    sta VIC_SPRITE_COLR + 3

    ; sprite 4
    lda sprites_state + s::sx
    sta VIC_SPRITE_4_X
    lda sprites_state + s::sy
    sta VIC_SPRITE_4_Y
    lda sprites_state + s::data
    sta screen_0 + SPRITE_IX_OFST + 4
    sta screen_1 + SPRITE_IX_OFST + 4
    lda sprites_state + s::color
    sta VIC_SPRITE_COLR + 4

    ; sprite 5
    lda sprites_state + s::sx
    sta VIC_SPRITE_5_X
    lda sprites_state + s::sy
    sta VIC_SPRITE_5_Y
    lda sprites_state + s::data
    sta screen_0 + SPRITE_IX_OFST + 5
    sta screen_1 + SPRITE_IX_OFST + 5
    lda sprites_state + s::color
    sta VIC_SPRITE_COLR + 5

    ; sprite 6
    lda sprites_state + s::sx
    sta VIC_SPRITE_6_X
    lda sprites_state + s::sy
    sta VIC_SPRITE_6_Y
    lda sprites_state + s::data
    sta screen_0 + SPRITE_IX_OFST + 6
    sta screen_1 + SPRITE_IX_OFST + 6
    lda sprites_state + s::color
    sta VIC_SPRITE_COLR + 6

    ; sprite 7
    lda sprites_state + s::sx
    sta VIC_SPRITE_7_X
    lda sprites_state + s::sy
    sta VIC_SPRITE_7_Y
    lda sprites_state + s::data
    sta screen_0 + SPRITE_IX_OFST + 7
    sta screen_1 + SPRITE_IX_OFST + 7
    lda sprites_state + s::color
    sta VIC_SPRITE_COLR + 7
