    org $3400
SP = ' '
CR = 0x0d    

    ldx #0
cmp_next_char
    lda $42, x
    cmp #CR
    beq end
    cmp #SP
    beq next_char
    stx $40 ; Save index of last non blank char
next_char
    inx
    jmp cmp_next_char
end

    org $42
    .by "A HAT  ", CR
