.model small
.code
    org 100h
Programa_Int:
    jmp Reside
    ;Declaración de variables
    contador db 0
   
    
Rutina_Servicio proc
    cli
    INC contador
    CMP contador, 2
    JNE fin

    MOV AH, 0
    INT 16H
    MOV AL, 03h
    MOV AH, 0
    INT 10h
    MOV AH, 4Ch
    INT 21h
    fin:
    sti
    iret 

endp 

Reside: ;Etiqueta para determinar la dirección siguiente a
    ;la última de la rutina que debe quedar residente.
    mov dx, offset Rutina_Servicio
    mov ax, 0
    mov es, ax
    mov si, 1Ch*4
    cli
    mov es:[si], dx
    mov es:[si+2], cs
    sti
    mov dx, offset Reside
    int 27h
end Programa_Int