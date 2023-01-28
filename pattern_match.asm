    org $3400
    
    ldx #0
    ldy #$ff ; Strings don't match
compare
    lda $42, x
    cmp $52, x
    bne store_res
    inx
    cpx $41
    bcc compare
    ldy #0 ; Strings match
store_res
    sty $40

    org $41
    .by [str2 - str1]
str1
    org $42
    .by "CAT"
str2
    org $52
    .by "CAT"
