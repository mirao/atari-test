    org $3400
    
    lda #<(numbers-1)
    sta $42
    lda #>(numbers-1)
    sta $43
    lda #0
    ldy $41
    jmp is_list_completed
cmp_next_number
    cmp ($42), y
    bcs next_number
    lda ($42), y
next_number
    dey
is_list_completed
    bne cmp_next_number
    sta $40

    org $41
    .by 5
    org $44
numbers
    .by $67, $79, $15, $e3, $72
