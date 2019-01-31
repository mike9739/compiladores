;Primeras prubas con asambler Auto increible
    LIST P = 18f45k50
    #include<p18f45k50.inc>
    CONFIG WDTEN=OFF ; apafga el watchdog 45k50
    CONFIG MCLRE = ON; apaga el mclre
    CONFIG DEBUG = OFF;apaga el debugger :(
    CONFIG LVP = OFF; apaga la programación en bajo voltaje | esto solamente si se va a soldar
    CONFIG FOSC = INTOSCIO; Enciende el osicilador 4550
    
    Aux1 EQU 0x00 ;Reserva 1 byte para la variable aux1
    Aux2 EQU 0x01 ; Reserva 1 byte para la variable aux2
    
    org 0 ; pone la instrucción en la direccion 00
    CLRF PORTD
    CLRF TRISD
    MOVLB 0x0F  ;mueve el valor of al registro BSR -> guarda los 4 bits mas significativos de la memoria de datos
    CLRF ANSELD,1 ;
    MOVLW 0x01
    MOVWF PORTD ; solo deja encender un led
    
   MainLoop:
    RLNCF PORTD,F
    CALL Retardo
    BTFSS PORTD,7
    GOTO MainLoop
    loop2
    RRNCF PORTD,F
    CALL Retardo
    BTFSS PORTD,0
    GOTO loop2
    GOTO MainLoop
   Retardo:
    DECFSZ Aux1,1 ; deementa aux1 en 1 salta siguiente 
    GOTO Retardo
    DECFSZ Aux2,1
    RETURN
   END
    
    
    

