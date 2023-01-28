    org $3400

    lda #0
    ldx $41
    cpx #10
    bcs store_result ; Not a digit, zero result
    lda $50, x
store_result
    sta $42

    org $41
    .by 4
    org $50
    .by $3f, $06, $5b, $4f, $66, $6d, $7d, $07, $7f, $6f

