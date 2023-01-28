    org $3400

    ldx #$ff ; It means the ASCII is not a decimal digit
    lda $40
    cmp #$30
    bcc save_result
    cmp #$40
    bcs save_result
    and #%0000 1111 ; Extract decimal digit
    tax
save_result
    stx $41

    org $40
    .by $37

