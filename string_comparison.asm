    org $3400

    ldy #$ff
    ldx #0
cmp_char
    lda $42, x
    cmp $52, x
    beq next_char
    bcc save_res
    bcs first_is_larger
next_char
    inx
    cpx $41
    bcc cmp_char
first_is_larger
    iny
save_res
    sty $40

    org $41
    .by [end_str - start_str]
    org $42
start_str
    .by "CAT"
end_str
    org $52
    .by "BAT"

