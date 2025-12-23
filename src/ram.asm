
SECTION "WRAM", WRAM0[$C000]


;frameBuffer:
; - each byte consists of four pairs of bits representing a single pixel each
; - colors are (from lightest to darkest): 00 01 10 11
frameBuffer::
    ds 20*18 ;(number of tiles in framebuffer)
frameBufferEnd::
    ds 2
;frameDoneFlag::
; if this flag contains $00, framebuffer is loaded into VRAM 
frameDoneFlag::
    ds 1

