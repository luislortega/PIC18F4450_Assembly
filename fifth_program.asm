PORT_A EQU 0XF80
TRIS_A EQU 0XF92
LAT_A EQU 0XF89
 
PORT_B EQU 0XF81
TRIS_B EQU 0XF93
LAT_B EQU 0XF8A
ADCON_1 EQU 0XFC1
W EQU 0X0
ACCESS EQU 0X0
 
OSCCON EQU 0XFD3
    
    CODE    0x00
    MOVF OSCCON,W,ACCESS
    IORLW 0X73
    MOVWF OSCCON,ACCESS
    
    MOVLW 0XFF
    MOVWF TRIS_A,ACCESS
    MOVLW 0X0F
    MOVWF ADCON_1,ACCESS
    MOVLW 0X00
    MOVWF TRIS_B,ACCESS
;-------------------------
LOOP
    MOVF PORT_A,W,ACCESS
    ANDLW 0X07
    ADDLW 0X02
    MOVWF LAT_B ,ACCESS
    GOTO LOOP
    
    END