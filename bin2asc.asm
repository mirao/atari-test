    org $3400

    ldx #7
    lda $41
check_bit
    tay
    and #1
    ora #$30
    sta $42, x
    tya
    lsr
    dex
    bpl check_bit

; Alternative solution. Cons: It changes original value in $41
;
;     ldx #7
; check_bit
;     lsr $41
;     lda #$30
;     adc #0
;     sta $42, x
;     dex
;     bpl check_bit
    
    org $41
    .by %11010010

