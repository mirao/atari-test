    .macro multiply
    ; multiply two 8-bit numbers
    ; input: two numbers %1, %2
    ; output: result in registers x,y (LOW, HIGH)
    ; example: "multiple 200,3" produces X=$58, Y=$02 (result $0258=600)

    lda #0
    ldx #0
    ldy #0
    sta mul1 + 1
    lda #%1
    sta mul1 ; store 1st multiplier
    lda #%2
    sta mul2 ; store 2nd multiplier
start    
    lda mul2 
    beq end; ; 2nd number is exhausted
    lsr mul2
    bcc multtwo ; only multiply if significant bit is 0
    ; bit from last binary base == 1, add result to sum
    txa
    clc
    adc mul1
    tax
    tya
    adc mul1 + 1
    tay
multtwo
    ; multiply 1st number by 2
    asl mul1
    rol mul1 + 1
    bcc start ; always jump
mul1 .ds 2
mul2 .ds 1
end
    .endm

    .macro hexToDec
    ; convert word to decimal digits
    ; input: word in registers x, y (LOW, HIGH)
    ; output: five digits in location "decimal" (from highest to lowest)
    stx wordnum
    sty wordnum + 1
    ldy #0 ; decimal base index, used for subtraction
nextDigit
    ldx #0 ; decimal digit
isBaseGreater    
    lda wordnum + 1
    cmp decbases + 1, y
    bcc nextbase
    bne subtractBase
    lda wordnum
    cmp decbases, y
    bcc nextBase
subtractBase
    lda wordnum
    sec
    sbc decbases, y
    sta wordnum
    lda wordnum + 1
    sbc decbases + 1, y
    sta wordnum + 1
    inx
    bpl isBaseGreater; always jump
nextBase
    tya
    lsr
    tay
    txa
    sta decimal, y
    iny
    cpy #5
    beq end
    tya
    asl
    tay
    bpl nextDigit; always jump and process next digit

decbases .byte <10000, >10000, <1000, >1000, <100, >100, <10, >10, <1, >1
decimal .ds 5
wordnum .ds 2    
end
    .endm