    org $3400
    
    ldy #0
    ldx $41
is_list_finished
    beq store_count
    lda $41, x
    bpl next_number
    iny ; New negative number
next_number
    dex
    jmp is_list_finished
store_count
    sty $40

    org $41
    .by 6
    org $42
    .by $68, $f2, $87, $30, $59, $2a
