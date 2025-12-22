SECTION "Tile Generation Code", ROM0

;generateTiles:
;- generates 256 tiles from $8000 - $8FFF
; these are all possible combinations of 4x4 meta pixel tiles/blocks
generateTiles::
    ld hl, $8000

    ;NOTE: from now on, each dot on the DMG screen will be called a dot or DMG pixel, 
    ; while blocks of 4 dots will be called meta pixels or just pixels 
.generateNextTile
    ;first get current tile number
    ld a, %11110000
    and l           ;get higher bytes of l
    ld b, a ;store in b to get lower bytes of h next
    ld a, %00001111
    and h
    or b ;get higher bytes of l back
    swap a 
    ;A reg now contains the current tile number
    ld c, a ;store in c, this way we can use the current tile number later on
        and %10000000 ;check for the higher bit (color bit 1) of the first pixel in tile
        jr z,.p1c1 ; check if zero in pixel #1 color bite #1 
            ld a, %11110000  ;if it is a one, we want the whole upper nibble (4 dmg pixels) to be 1
        .p1c1
        ld b, a ;store in b to merge with next four DMG pixels latee
        ld a, c ; remember that tile number?
        and %00100000
        jr z,.p2c1 ;pixel #2 color bit #1 (higher bit)
            ld a, %00001111
        .p2c1
        or b ;merge with first 4 DMG pixels
        ld [hl+], a ;write to current VRAM ADDR
        ld d, a ; store in D, cause we'll need to write this 3 more times for a total of 4 rows of DMG pixels

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

        ld e, a;store in e to write to next 4 rows of DMG pixels

        ;row #2
        ld a, d
        ld [hl+], a  
        ld a, e
        ld [hl+], a 
        ;row #3
        ld a, d
        ld [hl+], a 
        ld a, e
        ld [hl+], a 
        ;row #4
        ld a, d
        ld [hl+], a 
        ld a, e
        ld [hl+], a 

        ;Now do the same for the next two pixels...
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
    cp $FF ;check if we just finished the last tile ($FF)
    jr nz,.generateNextTile
    ret 
