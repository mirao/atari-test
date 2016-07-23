    ORG $3400
    icl "hellomc.mac"
    majne string2-string
    majne $20
    ldy #0
    mva #$11 ($58),y
    jmp *

string
    dta c"1Retez"
string2
    dta d"1Retez"
