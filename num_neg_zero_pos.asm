    org $3400
    
    lda #0
    sta $40 ; negative count
    sta $41 ; zero count
    sta $42 ; positive count
    ldx $43
is_last_num
    beq check_done
    lda $43, x
    beq inc_zero
    bpl inc_positive
    inc $40
    jmp next_num
inc_zero
    inc $41
    jmp next_num
inc_positive
    inc $42
next_num
    dex
    jmp is_last_num
check_done
    
    org $43
    .by 6
    org $44
    .by $68, $f2, $87, $00, $59, $2a
