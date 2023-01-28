    org $3400
    
    lda $40
    eor #%1111 1111
    clc
    adc #1
    sta $41
    
    org $40
    .by $3e
