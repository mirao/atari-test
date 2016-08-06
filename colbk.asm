    ORG $3400
.PROC main
loop mva #$ff routine.counter
     jsr routine
     jmp loop ;Main loop


.PROC routine
.var counter .byte
color4 = $2c8
timer = 20
time = 50
loop mva counter color4
     lda timer
     add #time
wait1sec
     cmp timer
     bne wait1sec
     dec counter
     bne loop
     rts     
.ENDP

.ENDP