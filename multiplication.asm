    *= $3400
    .include math.asm
    multiply 209, 123 ; multiply two numbers
    hexToDec ; convert the product to string of decimal digits

; wait for key press
CH = 764
key     lda #$FF
        cmp CH
        beq key
        sta CH
        rts
