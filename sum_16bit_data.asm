    org $3400
    
    lda #0 ; LSB sum
    ldy #0 ; MSB sum
    clc
    ldx $42
is_sum_done
    beq sum_done
    adc $42, x
    bcc get_next_num
    iny
    clc
get_next_num
    dex
    jmp is_sum_done
sum_done
    sta $40
    sty $41

    org $42
    .by 3
    org $43
    .by $c8, $fa, $96
