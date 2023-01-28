    org $3400

    ldx #7
    mva #0 $41 ; Bin result
    mva #$ff $40 ; Result of bin digit validity, 0 means all digits are 0 or 1, otherwise $ff
    ldy #1 ; Bit showing "1" on position of ASC digit
next_digit
    lda $42, x
    and #$0f
    cmp #2
    bcs end ; Not a binary digit 0/1, end program
    cmp #1
    bcc next_bit; Binary digit "0", don't add to result
    tya
    ora $41
    sta $41
next_bit
    tya
    asl ; Set 1 to current ASC digit position
    tay
    dex
    bpl next_digit
    inc $40 ; Set success, i.e. 0
end

    org $42
    .by '0', '0', '0', '0', '0', '0', '0', '1'
