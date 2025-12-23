INCLUDE "include/hardware.inc"

SECTION "Entry point", ROM0



Setup::
	; Here is where the fun begins, happy coding :)
	

	di	; disable interrupts
	ld	SP, $FFFF  

	;set interrupt flags:
	ld a, IF_VBLANK
	ld [rIE], a
	ei
	;-------- Configure LCD --------
	ld	a, [rLCDC]	
	and	~LCDC_OBJ_ON	
	ld	[rLCDC], a	
	;configure palettes
    ld a, %11011000
	ld [rBGP], a
	nop
	halt
	nop
	;------- LOAD TILES --------
	;stop lcd
.waitVBlank
	nop
    ldh a, [rSTAT]
	and %11
	cp %01
    jr nz, .waitVBlank 
	ld	a, [rLCDC]
	and ~LCDC_ON 
	ld	[rLCDC], a	
	;load tiles
	call generateTiles

	;turn LCD ON again
	ld	a, [rLCDC]
	or	LCDC_ON
	ld	[rLCDC], a	






MainLoop::
	halt 
	nop 

	jr MainLoop
