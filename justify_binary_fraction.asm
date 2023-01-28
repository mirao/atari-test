    org $3400
    
    ldx #0
    lda $40
is_msb_set
    beq store_result
    bmi store_result
    inx
    asl
    jmp is_msb_set
store_result
    sta $41
    stx $42

    org $40
    .by $cb
