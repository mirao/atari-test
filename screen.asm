    icl "string.asm"
    .ifndef math
        icl "math.asm"
    .endif

    .macro makeDigitsPrintable (decimal)
    ; make decimal digits printable
    ; input: word in registers x, y (LOW, HIGH)
    ; output: decimal - indirect location of 5-decimal digit string
    ; output: register X - 1st position after relocated number == length of new numbers
    
    hexToDec :decimal ; convert number to string having decimal digits
    trimZero :decimal, decDigitCnt

    txa
    tay
    dey
makePrintable
    lda (:decimal), y
    ora #$10
    sta (:decimal), y
    dey
    bpl makePrintable
    .endm    

    .macro printStr (string, length)
    ; print string on screen in GRAPHICS 0
    ; input: string - indirect location of string
    ;        length - location with length in bytes
savmsc = $58
    copy :string, savmsc, :length
    .endm