.MODEL SMALL
.STACK 100H
.DATA
    INP_MSG DB "ENTER A CHARACTER: $"
.CODE
MAIN PROC
    ;initializing
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, INP_MSG
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    ADD AL, 20H 
    MOV CL, AL
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    
    MOV DL, CL
    INT 21H
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN