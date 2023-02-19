    org $3400

    ldx $40
    clc
    sed
add_next_byte
    lda $40, x
    adc $50, x
    sta $40, x
    dex
    bne add_next_byte 

    org $40
    .by 4
    org $41
    .by $36, $70, $19, $85
    org $51
    .by $12, $66, $34, $59
