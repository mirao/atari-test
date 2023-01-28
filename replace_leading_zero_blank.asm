    org $3400
    
    ldx #0
    ldy #' '
    lda #'0'
cmp_next_digit
    cmp $41, x
    bne replace_done
    sty $41, x ; Replace 0 by blank
    inx
    cpx $40
    bcc cmp_next_digit
replace_done
    org $40
    .by 8
    org $41
    .by "00812345"
