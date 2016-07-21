    *= $3400
CH = 764
    .include multiply.asm
    multiply 200, 3
key     lda #$FF
        cmp CH
        beq key
        sta CH
        rts
