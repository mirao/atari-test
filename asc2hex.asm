    org $3400

    lda $40
    and #%0100 1111 ; Convert uppercase to lowercase and ascii digit to hex digit 
    cmp #10 ; Is result a decimal digit?
    bcc store_result
    ; Convert ASCII 'A' - 'Z' to hex digit
    sbc #'A'
    adc #9
store_result
    sta $41

    org $40
    .by 'c'

