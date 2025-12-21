SECTION "Tile Generation Code", ROM0

;generateTiles:
;- generates 256 tiles from $8000 - $8FFF
generateTiles::
    ld hl, $8000

.generateTile
    ;first get current tile number
    ld a, %11110000
    and l           ;get higher bytes of l
    ld b, a ;store in b to get lower bytes of h next
    ld a, %00001111
    and h
    or b ;get higher bytes of l back
    swap a 
    ;A reg now contains the current tile number
    ld c, a
        and %10000000
        jr z,.p1c1
            ld a, %11110000
        .p1c1
        ld b, a
        ld a, c
        and %00100000
        jr z,.p2c1
            ld a, %00001111
        .p2c1
        or b
        ld [hl+], a 
        ld d, a

        ld a, c
        and %01000000
        jr z,.p1c2
            ld a, %11110000
        .p1c2
        ld b, a
        ld a, c
        and %00010000
        jr z,.p2c2
            ld a, %00001111
        .p2c2
        or b
        ld [hl+], a 

        ld e, a
        ld a, d
        ld [hl+], a 
        ld a, e
        ld [hl+], a 
        ld a, d
        ld [hl+], a 
        ld a, e
        ld [hl+], a 
        ld a, d
        ld [hl+], a 
        ld a, e
        ld [hl+], a 


        ld a, c
        and %00001000
        jr z,.p3c1
            ld a, %11110000
        .p3c1
        ld b, a
        ld a, c
        and %00000010
        jr z,.p4c1
            ld a, %00001111
        .p4c1
        or b
        ld [hl+], a 
        ld d, a

        ld a, c
        and %00000100
        jr z,.p3c2
            ld a, %11110000
        .p3c2
        ld b, a
        ld a, c
        and %00000001
        jr z,.p4c2
            ld a, %00001111
        .p4c2
        or b
        ld [hl+], a         
        
        ld e, a
        ld a, d
        ld [hl+], a 
        ld a, e
        ld [hl+], a 
        ld a, d
        ld [hl+], a 
        ld a, e
        ld [hl+], a 
        ld a, d
        ld [hl+], a 
        ld a, e
        ld [hl+], a 

    ld a, c
    cp $FF
    jr nz,.generateTile

    



    ret 
