SECTION "VBlank Framebuffer Update Routine", ROM0

;updateFrameBuffer:
; copies 20*18 bytes from WRAM frameBuffer
; to VRAM tilemap at $9800 
updateFrameBuffer::
    push af
    ld a, [frameDoneFlag]
    or 0
    jr nz,.return
    push de
    push hl
    ld hl, frameBuffer
    ld de, $9800 - 1 ;offset cause we'll start by incrementing

.nextTile
    inc de
    ld a, [hl+]
    ld [de],a
    ld a, e
    ; check if end of the row reached:

    and $1F
    cp $13

    jr nz,.nextTile ; copy next tile if were not at the end of the row
    ; if end of the row reached:
    ld a, e
    or $0F ;send to end of row
    ld e, a

    ;check if both conditions for having finished the transfer have been met
    ld a, l
    cp low(frameBufferEnd)
    jr c,.nextTile
    ld a, h
    cp high(frameBufferEnd)
    jr c,.nextTile
    ld [frameDoneFlag],a ;set frameDoneFlag to anything other than done





    pop hl
    pop de
.return
    pop af
    reti