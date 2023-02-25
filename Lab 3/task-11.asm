.MODEL SMALL
.STACK 100H
.DATA
    T DB "Y$"
    NT DB "N$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 1
    INT 21H 
    SUB AL, 30H
    MOV BH, AL ;A
    
    MOV AH, 1
    INT 21H   
    SUB AL, 30H
    MOV BL, AL ;B
    
    MOV AH, 1
    INT 21H 
    SUB AL, 30H
    MOV CL, AL ;C
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, BH
    MOV AL, BL
    ADD AH, AL
    IF1:
    CMP AH, CL
    JLE PRINT_NT
    JMP IF2
    
    MOV AH, BL
    MOV AL, CL
    ADD AH, AL
    IF2:
    CMP AH, BH
    JLE PRINT_NT
    JMP IF3
    
    MOV AH, BH
    MOV AL, CL
    ADD AH, AL
    IF3:
    CMP AH, BL
    JLE PRINT_NT
    JMP PRINT_T
    
    PRINT_NT:
    MOV AH, 9
    LEA DX, NT
    INT 21H
    JMP EXIT
    
    PRINT_T:
    MOV AH, 9
    LEA DX, T
    INT 21H
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    