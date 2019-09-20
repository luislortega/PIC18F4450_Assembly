;*****************************************************
;*Programa que coloca los números de 0x780 y 0x3400
;*a partir de las direcciones 0x000 y 0x002 y la suma de ambos
;*en la dirección 0x004
;*****************************************************
;-----------tipo de microprocesador y números por omisión-------------------
LIST P=18F4550, r=Dec ;LIST directiva que sirve para indicar el tipo de
;microcontrolador PIC18F4550, y en que base
;están los números por omisión, decimal
;------------------------------Área de datos RAM--------------------------------
ACCESS_OVR 0x00 ;directiva para separar memoria de datos en el
;rango 0x000 a 05F, forzar iniciar en 0x000
OPER1_16 RES 2 ;reserva dos byte en RAM a partir de la dirección 0x000
OPER2_16 RES 2 ;reserva dos byte en RAM a partir de la dirección 0x002
RESUL_16 RES 2 ;reserva dos byte en RAM a partir de la dirección 0x004
;--------inicia código----------------------------------------------------------
RST CODE 0x00 ;RST: etiqueta, identifica la dirección de la memoria
;de programa donde esta la instrucción movlw low 0x780
;CODE: directiva que indica que es código lo que sigue
;0x00: forzar a que la primera instrucción se coloque en
;la dirección 0x00 de la memoria de programa.
;Recuerde la mayoría de las instrucciones son de dos byte
movlw low 0x780 ;instrucción que mueve el valor 80H registro W => movlw k
;la directiva low mueve los 8 bits bajos del números
movwf OPER1_16, 0 ;mueve el contenido del WREG a la dirección de
;memoria 0x000=>movwf f, a
movlw high 0x780 ;instrucción que mueve el valor 07H registro W => movlw k
;la directiva high mueve los 8 bits más significativos del números
movwf OPER1_16+1, 0 ;mueve el contenido del WREG a la dirección de
;memoria 0x001=>movwf f, a
movlw low 0x3400 ;instrucción que mueve el valor 00H registro W => movlw k
;la directiva low mueve los 8 bits bajos del números
movwf OPER2_16, 0 ;mueve el contenido del WREG a la dirección de
;memoria 0x002=>movwf f, a
movlw high 0x3400 ;instrucción que mueve el valor 34H registro W => movlw k
;la directiva high mueve los 8 bits altos del números
movwf OPER2_16+1, 0 ;mueve el contenido del WREG a la dirección de
;memoria 0x003=>movwf f, a
;---suma parte baja---------------------------------------------------------------------------------------------
movf OPER1_16, 0, 1 ;mueve la parte baja del primer operando el reg. W
addwf OPER2_16, 0, 1 ;suma el contenido de W con parte baja de operando dos
movwf RESUL_16, 1 ;guarda resultado en ella memoria 0x004

;----suma parte alta----------------------------------------------------------------------------------------------
movf OPER1_16+1, 0, 1 ;mueve la parte alta del primer operando el reg. W
addwfc OPER2_16+1, 0, 1 ;suma el contenido de W mas acareo con parte alta
movwf RESUL_16+1, 1 ;del operando dos guarda resultado en ella memoria
;0x005
END

