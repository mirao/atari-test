    *= $3400
    .include math.asm
    .include screen.asm
    .include keyboard.asm

num1 = 56
num2 = 229
    ldx #<num1
    ldy #>num1
    makeDigitsPrintable multiplier1

    ldx #<num2
    ldy #>num2
    makeDigitsPrintable multiplier2
    
    multiply num1, num2 ; multiply two numbers
    makeDigitsPrintable product
    strlen = endofstring - multiplier1 
    printStr multiplier1, strlen ; print in format "num1*num2=product"
    keypress ; stops program unless you press key
    rts

decimal .ds decDigitCnt  
multiplier1
        .ds decDigitCnt
    .sbyte "*"
multiplier2
        .ds decDigitCnt
    .sbyte "="
product .ds decDigitCnt
endofstring