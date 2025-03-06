.MODEL SMALL

.STACK 100h

.DATA 
    CADENA DB ' -111111112222222233333333444444445555555566666666777777778888888899999999AEIOU *' 

.CODE
    MOV AX, SEG CADENA
    MOV DS, AX
    
    MOV AL, 03h
    MOV AH, 00H
    INT 10h
    
    MOV AX, 0B800h
    MOV ES, AX

    MOV DI, 0
    
    mostrar:
    MOV AL, CADENA[SI]
    MOV AH, 0Ah
    MOV ES:[DI], AX
    ADD DI, 2
    INC SI
    CMP CADENA[SI], '*'
    JNE MOSTRAR
    
    MOV SI,0
    INC CADENA[0]
    CMP DI, 3998
    JBE MOSTRAR

    MOV DI,0
    MOV AL,03h
    MOV AH, 0
    INT 10h
    jmp mostrar

END

