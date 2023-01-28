    org $3400
    
    ldx #0 ; Index of char
    lda #$0d
next_char
    cmp $41, x
    beq store_length
    inx
    jmp next_char
store_length
    stx $40

    org $41
    .by "RATHER", $0d
