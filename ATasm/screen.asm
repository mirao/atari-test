    .include copy.asm
    .if .not .def math
        .include math.asm
    .endif

    .macro makeDigitsPrintable
    ; make decimal digits printable
    ; input: %1: location of 5-decimal digit string
    hexToDec %1 ; convert number to string having decimal digits
    ldy #decDigitCnt-1
makePrintable
    lda %1, y
    ora #$10
    sta %1, y
    dey
    bpl makePrintable
    .endm    

savmsc = $58
    .macro printStr
    ; print string on screen in GRAPHICS 0
    ; input: %1 - location of string
    ;        %2 - length in bytes
    copy %1, savmsc, %2
    .endm