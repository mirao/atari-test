; module for working with strings

    .macro copy (source, dest, length)
    ; makes a copy of string
    ; input: 
    ; source - source addr indirect
    ; dest - destination addr indirect
    ; length - location with length in bytes, <256
    ldy :length
    dey
cp  lda (:source), y
    sta (:dest), y
    dey
    bpl cp
    .endm

    .macro trimZero (num, length)
    ; trims leading zeroes from decimal number - by relocating of number back in memory
    ; input: num - indirect location of num you want trim
    ;        length - length in bytes, <256
    ; output: num - modified inline
    ;         register X - 1st position after relocated number == length of new number
    
        ldy #$ff ; before 1st digit is read
        ldx #0 ; index of last relocated digit
nextZero
        iny
        cpy #:length
        bcs endofnum
        lda (:num), y
        beq nextZero
copyNext        
        tya
        pha
        lda (:num), y
        pha
        txa
        tay
        pla
        sta (:num), y
        pla
        tay
        iny
        inx
        cpy #:length
        bcc copyNext ; always jump and copy next char
endofnum
        cpx #0
        bne end
        inx ; number was zero "00000", keeping only "0"
end
    .endm