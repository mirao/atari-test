    org $3400
    
    lda $40
    cmp $41
    bcc store_num
    lda $41
store_num
    sta $42

    org $40
    .by $75, $a8
