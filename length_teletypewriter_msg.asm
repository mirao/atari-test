    org $3400
STX = 2
ETX = 3    

    ldx #0 ; Char index
    ldy #0 ; String length
    lda $41, x
    cmp #STX
    bne store_msg_length
    inx
    lda #ETX
cmp_next_char
    cmp $41, x
    beq store_msg_length
    inx
    iny
    jmp cmp_next_char
store_msg_length
    sty $40
    
    org $41
    .by STX, "HELLO", ETX
