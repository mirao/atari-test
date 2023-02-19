    org $3400

    ldx $40
    clc
add_next_byte
    lda $40, x
    adc $50, x
    sta $40, x
    dex
    bne add_next_byte 

    org $40
    .by 4
    org $41
    .by $2f, $5b, $a7, $c3
    org $51
    .by $14, $df, $35, $b8
