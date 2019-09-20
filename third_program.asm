RADIX HEX

; ------------------ DATOS DEL PROGRAMA ------------------
    W EQU 0
    ACS EQU 0 ;direcciona a una localidad de memoria limitada
    BS equ 1 ;direcciona a todas las localidades de memorias disponibles en la RAM
 
    UDATA 0X060 ;memoria de datos
    OPER1 RES 1 ;reserva una localidad de memoria
    OPER2 RES 1
    RESUL RES 1
; ------------------ CODIGO ------------------
    CODE 0x00 ;memoria de programa
    movlb 0x0 ;para mover el BSR


    movlw 0x20
    movwf OPER1, BS
    movlw 0x26
    movwf OPER2, BS
    addwf OPER1, W, BS
    movwf RESUL, BS
    END