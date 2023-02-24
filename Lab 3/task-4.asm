.MODEL SMALL
.STACK 100H

.CODE
MAIN PROC
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV BL, AL
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AL, BL
    CMP AL, 1
    ;IF:
    JE PRINT_O
    
    CMP AL, 3
    ;IF:
    JE PRINT_O 
    
    CMP AL, 2
    ;IF:
    JE PRINT_E
    
    CMP AL, 4
    ;IF:
    JE PRINT_E
    
    JMP EXIT
    
    PRINT_O:
    MOV AH, 2
    MOV DL, 6FH
    INT 21H
    JMP EXIT
    
    PRINT_E:
    MOV AH, 2
    MOV DL, 65H
    INT 21H
    JMP EXIT
 
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    