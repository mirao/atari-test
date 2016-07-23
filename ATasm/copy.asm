    .macro copy
    ; makes a copy of memory block
    ; input: 
    ; %1 - source addr absolute $HHLL
    ; %2 - destination addr, indirect ($LL), Y
    ; %3 - length in bytes, <256
    ldy #%3 - 1
cp  lda %1, y
    sta (%2), y
    dey
    bpl cp
    .endm

    .macro trimZero
    ; trims zeroes from string
    ; input %1 - location of string you want trim
    ; input %2 - length in bytes, <256
    .endm