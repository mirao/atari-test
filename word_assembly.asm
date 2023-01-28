    org $3400
    
    lda $40
    and #%0000 1111
    asl
    asl
    asl
    asl
    lda $41
    and #%0000 1111
    ora $42
    sta $42

    org $40
    .by $6a, $b3
