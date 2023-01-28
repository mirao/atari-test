    org $3400
    
    ldx $40
    lda $50, x
    ldx $41
    clc
    adc $50, x
    sta $42

    org $40
    .by $03, $06

    org $50
    .by 0, 1, 4, 9, 16, 25, 36, 49
