SECTION "Rendering Routine", ROM0

renderPolygons::
;first clear the framebuffer:
di
    ld [frameBufferEnd], sp

    ld a, 36 ;cleared tile
    ld bc, 0 ;total amount of bytes
    ld sp, frameBufferEnd ;we'll fill framebuffer using sp
.loop	
    push bc
    push bc
    push bc
    push bc
    push bc
    push bc
    push bc
    push bc
    push bc
    push bc
    dec a
	jr	nz,.loop

    ld a, [frameBufferEnd + 1]
    ld h, a
    ld a, [frameBufferEnd]
    ld l, a
    ld sp, hl
    ld a, 11
    ld [frameDoneFlag],a
ei


    ld hl, polygonRAM
.nextPolygon
    ld a, [hl+] ;fetch polygon first byte
    ld b, a
    and POLYGON_TYPE; get type bits
dec a
jr c,.nextPolygon ;if carry, then a was 0, that means no polygon, skip to next
jr z,.dot ;if zero, we got one point
dec a
jr z,.line ;if zero, we got two points, thats a line
dec a
jr z,.triangle ;if zero, we got 3 points, triangle
dec a
jr z,.quad ;if zero, we got 4 points, quad

;*could add transparent entities using codes 1000 - 1111
; *these wouldn't use the mask and would write directly to what is in VRAM


    ret; if not, we prob got to the end of the polygon ram
.dot
    ld a, POLYGON_COLOR
    and b ;get polygon color stored in B reg's byte
    ld b, a


    

    ld a, [hl+];get y for point
    ;it should be a value from 0 to 35
    cp 35
    jr nc,.nextPolygon ;if not, it's out of the screen
    rrc a
    jr nc,.evenY
    swap b
    swap c ;choose lower bytes of the tile
    .evenY
    ld e, a
    ;d now contains Y tile postion
    ;e now contains X tile postion
    ; b and c contain the (X and Y accurate) color and mask respectively

    ld a, [hl+];get x for point
    ;it should be a value from 0 to 39
    cp 40
    jr nc,.nextPolygon ;if not, it's out of the screen
    ld c, %00111111 ;this is a mask for the pixel
    rrc a
    jr nc,.evenX
    rr b
    rr b ;this puts the color bytes on the second pixel
    ld c, %11001111 ;rotate the pixel mask too (faster with load)
    .evenX

    push hl ;save polygon ram address
    push bc ;save pixel info for when tile is found

        ;now find that tile
        ld hl, frameBuffer
        ld bc, 20
    .findPixelYs ;*this might be faster with an LUT
        sub 1
        jr c,.foundPixeY
        add hl, bc
        jr .findPixelY
    .foundPixeY
        ld c, e
        add hl, bc

    pop bc ;get mask and color back
    ld a, [hl]
    and c ;mask
    or b  ;color pixel
    ld [hl], a ;store in tile

    pop hl
    jr .nextPolygon
.line
    ;*the slope should be calculated as a Dx per Y
    ;then add 20 per y and add Dx and write to point
    ret
.triangle
    ;*would be better to first check if points are clockwise
    ;*then calculate two Dx
    ;finally start filling line by line using an algorithm that starts with either 01 or 11, continues with 11, finally ends with 11 or 10. all depends on pixel coordinate parity

    ret
.quad
    ;think about it...
    ret