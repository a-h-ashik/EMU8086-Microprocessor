.MODEL SMALL
.STACK 100H

.CODE
MAIN PROC
    MOV AX, 0D
    CMP AX, 0
    ;IF:
    JL NEGATIVE
    ;ELIF:
    JE ZERO
    ;ELSE POSITIVE
    MOV BX, 1D
    JMP EXIT
    
    NEGATIVE:
    MOV BX, -1D
    JMP EXIT 
    
    ZERO:
    MOV BX, 0D
    JMP EXIT
 
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    