    org $3400
    
    lda #0
    sta $40
    sta $41
    asl $42 ; Double index because of 16-bit numbers
    ldx $42
    jmp is_sum_done
sum 
    lda $40
    clc
    adc $41, x
    sta $40
    lda $41
    adc $42, x
    sta $41
    dex
    dex
is_sum_done
    bne sum

    org $42
    .by 3
    org $43
    .word $28f1, $301a, $4b89
