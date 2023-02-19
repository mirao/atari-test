    org $3400

    lda $41
    tay
    lda #0
    sta $41
    sta $42
    sta $43
check_bit_for_mult
    tya
    beq mult_done
    lsr
    tay
    bcc double_1st_num
    lda $42
    clc
    adc $40
    sta $42
    lda $43
    adc $41
    sta $43
double_1st_num
    asl $41
    asl $40
    bcc check_bit_for_mult
    inc $41
    jmp check_bit_for_mult
mult_done

; Optimalized solution - it starts from multiplier's MSB bit instead of LSB (the previous solution)
; 
;     lda #0
;     sta $43
;     ldx #8
; double_prod
;     asl ; Double product's LSB byte for every multiplier's bit
;     rol $43 ; Double product's MSB byte with getting of overflow from LSB
;     asl $40 ; Double multiplier
;     bcc next_bit ; Don't add multiplicand to product for multiplier's bit = 0
;     clc
;     adc $41 ; Add multiplicand to product for multiplier 1 
;     bcc next_bit
;     inc $43 ; Increase product's MSB as LSB overflowed
; next_bit
;     dex
;     bne double_prod
;     sta $42 ; Store product's LSB

    org $40
    .by $6f, $61
    ; Result of multiplication is in ($42, $43)

