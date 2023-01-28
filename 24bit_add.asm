    org $3400
    
    adb $40 $43 $46
    lda $41
    adc $44
    sta $47
    lda $42
    adc $45
    sta $48

    org $40
    .by $2a, $67, $35, $f8, $a4, $51
