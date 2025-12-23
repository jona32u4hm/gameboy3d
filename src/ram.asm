
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


    def POLYGON_TYPE  equ %00000_111
    def POLYGON_COLOR equ %11_000000
    export POLYGON_TYPE
    export POLYGON_COLOR
;polygonRAM:
; - contains array of 2d polygons
; - byte 1: bits 2-0 = Polygon Type
;               Types:  000 - none
;                       001 - dot       (not yet implemented)
;                       010 - line      (not yet implemented)
;                       011 - triangle  (not yet implemented))
;                       100 - quad      (not yet implemented)
;           bits 7-6 = color (NOTE: 00 is same as BKG)
; - next bytes are 2d points on screen: 1 byte per coordinate
polygonRAM::
    ds 3*4*10
polygonRAM_END::
