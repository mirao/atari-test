    org $3400
    
    ldx $40
load_ascii
    ldy #$ff ; Sum of bits
    lda $40, x
inc_sum
    iny
next_bit
    lsr
    bcs inc_sum
    beq bits_done
    jmp next_bit
bits_done
    tya
    and #%0000 0001
    beq next_ascii
    lda $40, x
    ora #%1000 0000 ; Set even parity
    sta $40, x
next_ascii
    dex
    bne load_ascii

    org $40 ; Number of ascii chars
    .by [end - $41]
    org $41
    .by "0123456ABC"
end
