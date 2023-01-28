    org $3400

    lda $40
    asl
    sta $42
    :2 asl
    clc
    adc $42
    ora $41
    sta $42

    org $40
    .by $02, $09

