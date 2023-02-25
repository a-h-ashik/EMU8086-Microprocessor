.MODEL SMALL
.STACK 100H

.CODE
MAIN PROC
    MOV AX, -2D
    
    CMP AX, 0
    ;IF:
    JL REPLACE
    ;ELSE:
    JMP EXIT
    
    
    REPLACE:
    MOV AX, 5D
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    