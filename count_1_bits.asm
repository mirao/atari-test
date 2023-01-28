    org $3400
    
    mva #0 $41
    lda $40
    ldx #8
move_bit_to_c
    lsr
    bcc next_bit
    inc $41
next_bit
    dex
    bne move_bit_to_c

    org $40
    .by %00111011
