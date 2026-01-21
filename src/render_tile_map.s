    ;
    ; generated code by `gen-render-tile-map.py`, do not edit
    ;

    ; ~10,075 cycles vs ~18,725 cycles using loops

    ; row 0
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH *  0, x
    sta screen + SCREEN_WIDTH *  0 + 39

    ; row 1
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH *  1, x
    sta screen + SCREEN_WIDTH *  1 + 39

    ; row 2
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH *  2, x
    sta screen + SCREEN_WIDTH *  2 + 39

    ; row 3
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH *  3, x
    sta screen + SCREEN_WIDTH *  3 + 39

    ; row 4
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH *  4, x
    sta screen + SCREEN_WIDTH *  4 + 39

    ; row 5
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH *  5, x
    sta screen + SCREEN_WIDTH *  5 + 39

    ; row 6
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH *  6, x
    sta screen + SCREEN_WIDTH *  6 + 39

    ; row 7
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH *  7, x
    sta screen + SCREEN_WIDTH *  7 + 39

    ; row 8
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH *  8, x
    sta screen + SCREEN_WIDTH *  8 + 39

    ; row 9
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH *  9, x
    sta screen + SCREEN_WIDTH *  9 + 39

    ; row 10
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH * 10, x
    sta screen + SCREEN_WIDTH * 10 + 39

    ; row 11
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH * 11, x
    sta screen + SCREEN_WIDTH * 11 + 39

    ; row 12
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH * 12, x
    sta screen + SCREEN_WIDTH * 12 + 39

    ; row 13
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH * 13, x
    sta screen + SCREEN_WIDTH * 13 + 39

    ; row 14
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH * 14, x
    sta screen + SCREEN_WIDTH * 14 + 39

    ; row 15
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH * 15, x
    sta screen + SCREEN_WIDTH * 15 + 39

    ; row 16
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH * 16, x
    sta screen + SCREEN_WIDTH * 16 + 39

    ; row 17
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH * 17, x
    sta screen + SCREEN_WIDTH * 17 + 39

    ; row 18
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH * 18, x
    sta screen + SCREEN_WIDTH * 18 + 39

    ; row 19
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH * 19, x
    sta screen + SCREEN_WIDTH * 19 + 39

    ; row 20
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH * 20, x
    sta screen + SCREEN_WIDTH * 20 + 39

    ; row 21
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH * 21, x
    sta screen + SCREEN_WIDTH * 21 + 39

    ; row 22
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH * 22, x
    sta screen + SCREEN_WIDTH * 22 + 39

    ; row 23
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH * 23, x
    sta screen + SCREEN_WIDTH * 23 + 39

    ; row 24
    ldx tmp1
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 +  0
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 +  1
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 +  2
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 +  3
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 +  4
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 +  5
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 +  6
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 +  7
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 +  8
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 +  9
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 10
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 11
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 12
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 13
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 14
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 15
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 16
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 17
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 18
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 19
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 20
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 21
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 22
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 23
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 24
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 25
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 26
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 27
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 28
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 29
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 30
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 31
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 32
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 33
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 34
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 35
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 36
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 37
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 38
    inx
    lda tile_map + TILE_MAP_WIDTH * 24, x
    sta screen + SCREEN_WIDTH * 24 + 39
