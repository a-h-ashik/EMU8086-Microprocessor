.MODEL SMALL
.STACK 100H
.DATA
    E DB "ENVEN$"
    O DB "ODD$"

.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV AH, 0H
    
    MOV BL, 2H
    DIV BL
    
    CONDITION1:
    CMP AH, 0H
    JE PRINTE
    ELSE:
    MOV AH, 9
    LEA DX, O
    INT 21H
    JMP EXIT
    
    PRINTE:
    MOV AH, 9
    LEA DX, E
    INT 21H
 
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    