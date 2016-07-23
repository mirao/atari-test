CH = 764
    .macro keypress
    ; wait for key press
key 
    lda #$FF
    cmp CH
    beq key
    sta CH
    .endm
