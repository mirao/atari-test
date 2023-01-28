    org $3400

    ldx #end - start - 1
    lda $40
cmp_next
    cmp $50, x
    beq save_result ; A 7-segment number found
    dex
    bpl cmp_next
    ; Not a 7-segment number, result = $ff
save_result
    stx $41

    org $40
    .by $4f
    org $50
start
    .by $3f, $06, $5b, $4f, $66, $6d, $7d, $07, $7f, $6f
end
