    org $3400
DEC_POINT = '.'
SP = ' '
    ldx #$ff
find_dec_point
    inx
    cpx $40
    beq trunc_done
    lda $41, x
    cmp #DEC_POINT
    bne find_dec_point
next_dec_digit
    inx ; Go to 1st digit after decimal point
    cpx $40
    beq trunc_done
    lda #SP
    sta $41, x
    jmp next_dec_digit
trunc_done

    org $40
    .by [end_str - start_str]
start_str
    org $41
    .by "7.81"
end_str
