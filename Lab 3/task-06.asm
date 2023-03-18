.MODEL SMALL
.STACK 100H

.CODE
MAIN PROC
    MOV AH, 1
    INT 21H
    MOV BL, AL
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    CONDITION1:
    CMP BL, 79H
    JE PRINT
    JNE CONDITION2
    
    CONDITION2:
    CMP BL, 59H
    JE PRINT
    ;ELSE:
    JMP EXIT
    
    PRINT:
    MOV AH, 2
    MOV DL, BL
    INT 21H
 
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    