    org $3400
    
DIVIDEND = $40
DIVISOR = $42
QUOTIENT = $43
REMAINDER = $44

// Non optimized solution, but allows division of not normalized numbers (with MSB bit set), e.g. 65025 / 255 = 255 
    ldy #0
    sty QUOTIENT
    lda DIVIDEND
    ldx DIVIDEND + 1
subtract
    sec
    sbc DIVISOR
    bcs inc_quotient
    dex
    cpx #$ff
    beq division_done
inc_quotient
    iny
    jmp subtract
division_done
    clc
    adc DIVISOR; Last subtraction led to negative value, add back divisor to get remainder
    sta REMAINDER
    sty QUOTIENT

; /*
;    Optimized solution, it uses similar principle as if you divide two decimal numbers on paper by pen, e.g.
   
;    Decimal 12909 ($326D) : 71 ($47)

;    Binary 0011001001101101 : 01000111 = 10110101 (Quotient = $B5)
;           001100100        (Q1)
;               111011       (Q0)
;               1110111      (Q1)
;                1100000     (Q1)
;                  110011    (Q0)
;                  1100111   (Q1)
;                   1000000  (Q0)
;                   10000001 (Q1)
;                     111010 (Remainder = $3A)
   
;    Code steps:
;    Preparation: Quotient = $6D, Remainder = $32
;    1) Quotient = $6D * 2 = $DB, Remainder = $32 * 2 - $47 = $1D, Quotient = $DA + 1 (after subtract) = $DB
;    2) Quotient = $DB * 2 = $B6, Remainder = $1D * 2 + 1 (from quotient) = $3B
;    3) Quotient = $B6 * 2 = $6C, Remainder = $3B * 2 + 1 (from quotient) - $47 = $30, Quotient = $6C + 1 (after subtract) = $6D
;    4) Quotient = $6D * 2 = $DA, Remainder = $30 * 2 - $47 = $19, Quotient = $DA + 1 (after subtract) = $DB
;    5) Quotient = $DA * 2 = $B6, Remainder = $19 * 2 + 1 (from quotient) = $33
;    6) Quotient = $B6 * 2 = $6C, Remainder = $33 * 2 + 1 (from quotient) - $47 = $20, Quotient = $6C + 1 (after subtract) = $6D
;    7) Quotient = $6D * 2 = $DA, Remainder = $20 * 2 = $40
;    8) Quotient = $DA * 2 = $B4, Remainder = $40 * 2 + 1 (from quotient) - $47 = $3A, Quotient = $B4 + 1 (after subtract) = $B5

;  */
;     ; Share LSB of dividend with quotient, because by shifting it and incrementing you get finally the same result as if you started with quotient = 0
;     lda DIVIDEND
;     sta QUOTIENT

;     ldx #8 ; Go through 8 bit (length of LSB byte)
;     lda DIVIDEND + 1; Finally it becomes a remainder
; parse_next_bit
;     ; Double 16-bit divident so that you get MSB bit of LSB byte into LSB bit of MSB byte
;     asl QUOTIENT
;     rol

;     cmp DIVISOR ; Check if divisor fits into dividend
;     bcc next_bit ; It didn't fit
;     sbc DIVISOR 
;     inc QUOTIENT ; Divisor fit into dividend, increase quotient
; next_bit
;     dex
;     bne parse_next_bit
;     sta REMAINDER ; Last partial remainder is a resulting remainder

    org $40 ; 16-bit dividend ($40, $41)
    .word 12909
    org $42 ; 8-bit divisor
    .by 71
    org $43
    ; Quotient = Divident / divisor
    org $44
    ; Remainder = Divident % divisor

