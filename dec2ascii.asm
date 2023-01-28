    org $3400

    ldx #' '
    lda $40
    cmp #10
    bcs save_blank
    ora #'0'
    tax
save_blank
    stx $41

    org $40
    .by 7
