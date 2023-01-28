    org $3400

    lda $40
    and #%1111 0000
    sta $41

    org $40
    .by $c4
