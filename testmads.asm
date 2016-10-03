    oPt s+
    ORG $3400

    .by >$1234, <$1234 ; == .dword
    .byte $45
    .dbyte $a230
    .word $a230
    .dword $a2305611
    .long $a23031

    .get "twobytes.bin"
    .xget "twobytes.bin"
    .print .get[0], " ", .get[1]
    .print .wget[0]
    .print .lget[0]
    .print .dget[0]

.echo .filesize "my.txt"
.print .sizeof miraloc
.local miraloc
    lda $1234
    BRK
    nop
.endl

.macro miram
    lda #2
    .exitm
    lda #3
.endm
    miram
.def ?@stack_offset = 2
    lda ($80 , x)
    lda ($80) , y
    lda #{dey}
    dey
rowcrs	= $54		; Wiersz  kursora
colcrs	= $55		; (2) Kolumna kursora
.var ax .word
.var y, x1 .byte

    POSITION #300, #$10
    rts

.proc POSITION,$4000 (.word ax .byte y) .reg
	sty rowcrs
	stx colcrs
	and #1
	sta colcrs+1
	rts

.endp

komentar *jiste coze
pata = 0

.local
abs	equ	$89AB
zp	equ	$7F
imm	equ	$F7

aj dop #imm	; 80 nn
    dop zp		; 44 nn
	dop zp,x	; 54 nn

	top	abs	; 0C nn nn
	top	abs,x	; 1C nn nn
.endl    
MADS=$2000
    lda #>MADS
beznam2=$4523    
jiste    run beznam2
 ini beznam2 + 1
; .reloc .byte

    lda #1
    sta 752
    rts
    
.align $9, 12 
    lda #2
    dta $20, $f
    dta a(beznam)
    
beznam=$4523    
    lmb #5
label5
 nop

 lmb #6

label6
 nop

 lda :label5
lmlab lmb #5, $6500
zajlab    
    ldx #=zajlab
 nmb
    ldx #=:zajlab
azv rmb
    ldx #=zajlab
    lda +[2+4]    ; lda 6
    opt c+
    lda [2+4]    ; lda 6
    LDA $0445F2
    stz $22
    opt c-
    lda.a 1
    ldx z:1
    dta [5+6]
jisteze .link "colbk.obx"

.PUBLIC labelp1, labelp2
 .GLOBAL labelg1
 .GLOBL labelg2

navesti ext .word
navesti2 .EXTRN .byte
.EXTRN label1,label2,label3 .byte
 BLK UPDATE EXTERNAL

; .reloc .byte
 BLK UPDATE ADDRESS

 lda 20\ cmp 20\ beq *-2
 lda #0  \lop  sta $a000,y  \ iny  \ bne lop     ; comments only at the end of this line
 lda\
 #\
 12

.enum portb
 rom_off = $fe
 rom_on = $ffaa
.ende
    lda portb.rom_off
    ldx portb(rom_on)
    .echo .len portb
.array TAB [255] .byte = $ff   ; allocate 256 bytes [0..255] with initial value $FF

 [63]:[127] = "A"              ; assign new values TAB[63]="A", TAB[127]="A"
 [21]:[85]  = "B"
 [18]:[82]  = "C"
 [58]:[122] = "D"
 [42]:[106] = "E"
 [56]:[120] = "F"
 [61]:[125] = "G"
 [57]:[121] = "H"
 [13]:[77]  = "I"
 [1] :[65]  = "J"
 [5] :[69]  = "K"
 [0] :[64]  = "L"
 [37]:[101] = "M"
 [35]:[99]  = "N"
 [8] :[72]  = "O"
 [10]:[74]  = "P"
 [47]:[111] = "Q"
 [40]:[104] = "R"
 [62]:[126] = "S"
 [45]:[109] = "T"
 [11]:[75]  = "U"
 [16]:[80]  = "V"
 [46]:[110] = "W"
 [22]:[86]  = "X"
 [43]:[107] = "Y"
 [23]:[87]  = "Z"
 [33]:[97]  = " "

 [52]:[180] = $7e
 [12]:[76]  = $9b

.enda
    lda tab,y
name .STRUCT

  x .word      ; lda #name.x = 0
  y .word      ; lda #name.y = 2
  z .long      ; lda #name.z = 4
  v .dword     ; lda #name.v = 7

  q :3 .byte   ; lda #name.q = 11

.ENDS          ; lda #name   = 14 (length)
    lda #name.y
    lda.z $80
    and.a $80,y
    ; lda.l $80
    org $20,$3080
 lda tmp+1
 
tmp lda #$00

    org $2000

    lda #0
    nop
    
    .local	temp, $60
    
        lda $ffff,x
        ldx $ffff,y
        lda (12), y
    .endl
    
    lda temp
    lda .adr temp

    ldy #0

copy  mva .adr(temp),y temp,y+
      cpy #.len temp
      bne copy

      rts

 org 0
 lda.w ytmp+1
ytmp lda #$00

#CYCLE #17
    .proc tb,$1000
tmp lda #0
.endp

.proc wait
 lda:cmp:req 20
 rts
.endp


.proc proctemp       ; warning not generated: 'Unreferenced procedure TEMP'
    lda #78
.endp

;  .def pi
lbif .nowarn .if .def pi
    .echo "Defined"
    lda #1
 .elseif 2==2
    .print "Undefined"
 .endif

labift ift 2==4
    .echo "No"
 eli 2==2
    ; els
    .print "Dva je dva"
 eif

iflabel .byte 45 
; #IF
lejblif #if .byte iflabel>=#10
    lda #$38
 #else
    lda #$39
#end

#while .byte iflabel>#100
jesl #while .byte iflabel<#200
#end
#end

 .echo .len wait    ; = 7

.print 2+.adr tb.tmp
;  lda .adr tb.tmp  ; = $2000
 lda tb.tmp       ; = $1000

    .print 2*7
.echo * - $1000, " Caues"
; sde .en
; jasneen end
; jasne2 ert 2 >= 2
; .echo jasne2
.error 20<1
;  blk nonsE $3500
; pf  smb 'COMTAB'
;            jsr pf
    ; blk reloc main
; .symbol mysmb

; segdef
	.segdef sdata adr0 $100
	.segdef test  adr1 $40

	; org $2000

	nop

	.cb 'ALA'

    .segment sdata

	:5 nop
	
    .endseg

	lda #0

    .segment test
	ldx #0
	clc
	dta d'ATARI'

    .endseg

adr0	.ds $100
adr1	.ds $40 

abs	equ	$89AB
zp	equ	$7F
imm	EQU	$F7

; local scope
@_jasne2?3A equ 1
    lda #jasne.@_jasne2?3A 

jasne .local

@_jasne2?3A equ 2

 lda #@_jasne2?3A
 ldx #:@_jasne2?3A

.endl

; .using/.use
.local move

tmp    lda #0
hlp    sta $a000

.local move2

tmp2   ldx #0
hlp2   stx $b000

.endl

.endl

.local main

.use move.move2

       lda tmp2
 
.using move

       lda tmp

.endl

; labels
?_n@@_ame1    EQU  $A000      ; defining a temporary global label
 ?_n@@_ame1 += 56
?_n@@_ame1 set 20 
name2      =   *          ; defining a global label
name3=12                 ; defining a global label
@?name4   EQU  'a'+32     ; defining a global label
    name5: equ 12           ; defining a non-global label that does not start at the beginning of the line
         name6: = 'v'     ; defining a non-global label that does not start at the beginning of the line
         lda :name2
         lda ?_n@@_ame1
         lda name2
         lda name5
; anonymous labels
@ dex
  bne @+
  stx $80
  lda @+1
@ lda #0
  bne @-
  bne @-1
@ nop  
  lda @-
  lda @-2

    .by 23 3, %10001111, 0xa2
.pages 10
    .align $200, 12 
.endpg
    .he 23 56 78
    .sb "Ret'ez"-2
    .sb "Ret'ez"*
ahoj .BY 'Retez"jiste'
    dta 5, 6, 7
    dta c"Retez"
    dta c'Retez'
lejbl lda 0XffFF
lda    
    sta lda    
    adc #2
    tay
    aso $1234
    // 
    ;neco

.get "twobytes.bin"
    .print .get[0], .get[1]
lbput    .put [1] = 12
    .print .get[0], .get[1]
lbsav    .sav [0] "twobytes2.bin",2
    ins "twobytes.bin"
    icl "hellomc.mac"
    majne string2-string
    majne $20
    ldy #0
    mva #$11 ($58),y
    lda #1
    STA:INC:RNE abs,X+

;rept
.rept 9, #    ; define 9 labels label0..label8
label2:1 mva #0 $d012+#
 .endr

:2 asl
//retez
; retez
/* jiste 
www */

    asl
    asl @
    lda#
    lda %110
    ldx 0x12
    ldy$A7
    lda(80),y
pak=0
    lda #0 .orpak
    lda #1 .and 3
    lda #1 .XOR 1
    lda #.not 1
    lda#1+3
    lda #1-2
    lda #1*2
    lda #6/2
    lda #6%5
    lda #6&5
    lda #6|5
    lda #6^5
    lda #6<<5
    lda #6>>5
    lda #6=5
    lda #6==5
    lda #6===5
    lda #6<>5
    lda #6!=5
    lda #6<5
    lda #6>5
    lda #6<=5
    lda #6>=5
    lda #6&&5
    lda #6||5
    lda #~5
    lda #-5
    lda #+5
    lda #!5
    lda #<$1234
lob = .LO ($1234)
    lda #>$1234
    lda #.HI($1234)
    lda #^$1234
    lda #=$1234
    lda :abs



*jasne
/**
; jiste
; ahoj
**/

string
    dta c"1Retez"
string2
    dta d"1Retez"
    dta a(sin(0,1000,256,0,63))
    dta b(rnd(0,20,40))
