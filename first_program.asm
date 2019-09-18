    RADIX HEX

; ------------------ DATOS DEL PROGRAMA ------------------
    W EQU 0
    ACS EQU 0
 
    UDATA_ACS 0X00 ;memoria de datos
    OPER1 RES 1 ;reserva una localidad de memoria
    OPER2 RES 1
    RESUL RES 1
; ------------------ CODIGO ------------------
    CODE 0X00 ;memoria de programa
    movlw 0x20
    movwf OPER1, ACS
    movlw 0x26
    movwf OPER2, ACS
    addwf OPER1, W, ACS
    movwf RESUL, ACS
    END