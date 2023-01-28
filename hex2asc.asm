    org $3400

    lda $40
    cmp #10
    bcc digit
    adc #['A' - '9' - 2] ; Prepare conversion to letter
digit
    add #'0' ; Convert to digit or finish conversion to letter
    sta $41

    ; Alternative solution
    ;   
    ; SED         ; MAKE ADDITIONS. DECIMAL
    ; CLC         ; CLEAR CARRY TO START
    ; LDA $40     ; GET HEXADECIMAL DIGIT
    ; ADC #$90    ; DEVELOP EXTRA 6 AND CARRY
    ; ADC #$40    ; ADD IN CARRY, ASCII OFFSET
    ; STA $41     ; STORE ASCII DIGIT
    ; CLD         ; CLEAR DECIMAL MODE BEFORE ENDING
    
    org $40
    .by $c

