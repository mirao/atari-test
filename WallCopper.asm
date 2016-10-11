;
;	>>> WallCopper - 32 bytes <<<
;
;	Atari XL - Jay Miner hardware - Copper built in.
;	Run from game DOS or emulator.
;
;	(c) 2012-11-14 by JAC! for fun and for yet another stupid Pouet craze.

	org $2000

loop	lda $d40b
	adc 20		;<C> does not matter
	bit $e3f8	;$10 in charset at $e3f3
	beq no_eor
	eor #15
no_eor	sta $d40a
	sta $d018
	eor #$ff
	sta $d01a
	jmp loop
