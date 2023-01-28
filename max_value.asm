    org $3400
    
    lda #0
    ldx $41
    jmp is_list_completed
cmp_next_number
    cmp $41, x
    bcs next_number
    lda $41, x
next_number
    dex
is_list_completed
    bne cmp_next_number
    sta $40

    org $41
    .by 5
    org $42
    .by $67, $79, $15, $e3, $72
