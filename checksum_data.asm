    org $3400
    
    lda #0
    ldx $41
    jmp is_sum_done
sum
    eor $41, x
    dex
is_sum_done
    bne sum
    sta $40

    org $41
    .by 3
    org $42
    .by $28, $55, $26
