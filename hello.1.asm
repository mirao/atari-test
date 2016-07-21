*=8000
.include "bank0code.asm"
*=bfff
.byte $ff ; ensure bank takes up exacly 16K
.bank
*=8000
.include "bank1code.asm"
*=bfff
.byte $ff