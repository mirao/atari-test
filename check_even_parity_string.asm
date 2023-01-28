    org $3400

    mva #$ff $40
    ldx $41
sum_bits
    ldy #0 ; Sum of bits
    lda $41, x
next_bit
    cmp #0
    beq check_parity_is_even
    asl
    bcc next_bit
    iny
    jmp next_bit
check_parity_is_even
    tya
    and #%0000 0001
    bne parity_odd
    dex
    bne sum_bits
    inc $40
parity_odd

    org $41
    .by [end_str - start_str]
    org $42
start_str
    .by $b1, $b2, $33
end_str
