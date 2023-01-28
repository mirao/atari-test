    org $3400
    
    lda #0
    ldx $41
is_sum_done
    beq sum_done
    clc
    adc $41, x
    dex
    jmp is_sum_done
sum_done
    sta $40

    org $41
    .by 3
    org $42
    .by $28, $55, $26, $13
