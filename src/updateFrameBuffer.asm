INCLUDE "include/hardware.inc"

SECTION "VBlank Framebuffer Update Routine", ROM0

;updateFrameBuffer:
; copies 20*18 bytes from WRAM frameBuffer
; to VRAM tilemap at $9800 
updateFrameBuffer::
    push af
    ld a, [frameDoneFlag]
    or 0
    jp nz,.return
    push de
    push hl
    push bc
    ld hl, $9933 ;starting at the end of the first 10 rows and we'll come backwards
    ld [frameBufferEnd], sp ;save stack pointer
    ld sp, frameBuffer + 20*10 - 2  ;point stack at the end of the first 10 rows in buffer
    
.next5Rows
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a

    ld a, l
    and $F3 ;send to end of row
    ld l, a

    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a

    ld a, l
    and $F3 ;send to end of row
    ld l, a

    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a

    ld a, l
    and $F3 ;send to end of row
    ld l, a

    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a

    ld a, l
    and $F3 ;send to end of row
    ld l, a

    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a

    ld a, l
    and $F3 ;send to end of row
    ld l, a


    cp $F3
    jp nz,.next5Rows

    ld hl, $9A33 ;starting at the end and we'll come backwards
    ld sp, frameBufferEnd - 2 ;point stack at the end of the buffer
    
.nextRow
.waitHBlank1
    ld a, [rSTAT]
    and %00000011 ; HBLANK
    jr nz,.waitHBlank1

    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
.waitHBlank2
    ld a, [rSTAT]
    and %00000011 ; HBLANK
    jr nz,.waitHBlank2
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a
    pop de
    ld a, d
    ld [hl-], a
    ld a, e
    ld [hl-], a

    ld a, l
    and $F3 ;send to end of row
    ld l, a


    cp $33
    jp nz,.nextRow

    ld a, [frameBufferEnd + 1]
    ld h, a
    ld a, [frameBufferEnd]
    ld l, a
    ld sp, hl

    pop bc
    pop hl
    pop de
.return
    pop af
    reti

