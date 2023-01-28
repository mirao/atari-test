    org $3400
    lda $40
    complement
    sta $42

    org $40
    .by %10100011

.macro complement
    eor #%1111 1111
.endm
