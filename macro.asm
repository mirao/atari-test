.MACRO VDLI
.IF %0<>1
.ERROR "VDLI: Wrong number of parameters"
.ELSE
ldy # <%1
ldx # >%1
lda #$C0
sty $0200
stx $0201
sta $D40E
.ENDIF
.ENDM

.MACRO ADD_WORD
.IF %0<2 .OR %0>3
.ERROR "ADD_WORD: Wrong number of parameters"
.ELSE
lda %1
clc
adc %2
.IF %0=3
sta %3
.ELSE
sta %2
.ENDIF
lda %1+1
adc %2+1
.IF %0=3
sta %3+1
.ELSE
sta %2+1
.ENDIF
.ENDIF
.ENDM

    *=  $2400
VDLI $1234
ADD_WORD addr1,addr1+1,addr1+2
addr1 .DS 3
