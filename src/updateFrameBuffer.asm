INCLUDE "include/hardware.inc"

SECTION "VBlank Framebuffer Update Routine", ROM0

;updateFrameBuffer:
; copies 20*18 bytes from WRAM frameBuffer
; to VRAM tilemap at $9800 
updateFrameBuffer::
    push af
    ld a, [frameDoneFlag]
    or 0
    jp nz,afterVBlank.return
    push de
    push hl
    ld hl, frameBuffer
    ld de, $9800 - 1 ;offset cause we'll start by incrementing

.nextRow
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a

    ld a, e
    or $0F ;send to end of row
    ld e, a
    cp $FF
    jr nz,.nextRow
afterVBlank: ; yeah, we hit a bottle neck here...

.nextRow

.waitHBlank1
    ld a, [rSTAT]
    and %00000011 ; HBLANK
    jr nz,.waitHBlank1

    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
.waitHBlank2
    ld a, [rSTAT]
    and %00000011 ; HBLANK
    jr nz,.waitHBlank2
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
.waitHBlank3
    ld a, [rSTAT]
    and %00000011 ; HBLANK
    jr nz,.waitHBlank3
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a
    inc de
    ld a, [hl+]
    ld [de],a


    

    ld a, e
    or $0F ;send to end of row
    ld e, a


    cp $3F
    jr nz,.nextRow
    bit 1,d
    jr z,.nextRow



    pop hl
    pop de
.return
    pop af
    reti