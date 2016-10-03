    ORG $2000  ;Save area
WSYNC =  $D40A       
COLPF2 = $D018
    LDX #0
START  ;Get current screen line
    STA WSYNC ; wait for start of next line
    STX COLPF2  ;Set as background color to see the rainbow
    INX
    INX
    JMP START  ;Loop

    RUN START ;Set RUNADR, so START is called after loading