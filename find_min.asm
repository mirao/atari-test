    org $3400
    
    ldx $41
    lda $42
check_min
    cmp $41, x
    bcc next_num
    lda $41, x ; New minimum
next_num
    dex
    bne check_min
    sta $40

    org $41
    .by 5
    org $42
    .by $67, $79, $15, $e3, $72
