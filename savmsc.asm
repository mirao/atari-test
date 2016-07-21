; fill screen by chars
    *=  $3400
    .opt obj
ch = 764
RUNAD = $2E0
savmsc = $58
enter = $9b
start   
    ldy #0
readchr    
    lda chars,y
    cmp #ENTER
    beq check
    sta (savmsc),y
    iny
    jmp readchr
check 
    LDA #255
    CMP ch
    BEQ check
    STA ch
    RTS
chars .sbyte "*Warning* Removing existing file on Atari disk image."
    .byte ENTER
    *= RUNAD
    .WORD start
