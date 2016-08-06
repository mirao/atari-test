    org $3400
    icl "math.asm"
    icl "screen.asm"
    icl "keyboard.asm"

num1 = 0
num2 = 0
explocStart = $d4 ; indirect location of 1st byte of the equation
explocCur = explocStart + 2; ; indirect location equation, current position

    ; store location of the string
    mwa #expression explocCur 
    mwa #expression explocStart  

    ldx #<num1
    ldy #>num1
    makeDigitsPrintable explocCur
    stx newPosition
    adw explocCur newPosition ; location for next string
    lda #"*" ; store sign for multiplication
    ldy #0
    sta (explocCur), y
    inw explocCur ; shift one char forward in memory

    ldx #<num2
    ldy #>num2
    makeDigitsPrintable explocCur
    stx newPosition
    adw explocCur newPosition ; location for next string
    lda #"=" ; store equation sign
    ldy #0
    sta (explocCur), y
    inw explocCur ; shift one char forward in memory
    
    multiply num1, num2 ; multiply two numbers
    makeDigitsPrintable explocCur
    stx newPosition
    adw explocCur newPosition ; end of the strig
    sbb explocCur explocStart length ; save length of the expression 

    printStr explocStart, length ; print in format "num1*num2=product"
    jmp * ; wait forever

expression .ds 3 + 1 + 3 + 1 + decDigitCnt ; allocate bytes for expression "num1*num2=product"
newPosition .ds 1
length .ds 1