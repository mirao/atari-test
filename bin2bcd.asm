    org $3400

    ldx #0 ; Number of tenth
    lda $40
is_remainder_known
    cmp #10
    bcc save_result
    sbc #10
    inx
    jmp is_remainder_known
save_result
    sta $42 ; Save remainder
    stx $41 ; Save tenth

    org $40
    .by 29
