SECTION "Rendering Routine", ROM0

renderPolygons::
    ld hl, polygonRAM
.nextPolygon
    ld a, [hl+] ;fetch polygon first byte
    and $07; get type bits
dec a
jr c,.nextPolygon ;if carry then a was 0, that means no polygon, skip to next
jr z,.dot ;if zero, we got one point
dec a
jr z,.line ;if zero, we got two points, thats a line
dec a
jr z,.triangle ;if zero, we got 3 points, triangle
dec a
jr z,.quad ;if zero, we got 4 points, quad
    ret; if not, we prob got to the end of the polygon ram
.dot
    ret
.line
    ret
.triangle
    ret
.quad
    ret