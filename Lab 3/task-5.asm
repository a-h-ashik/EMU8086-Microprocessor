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
    CMP BL, 5AH
    JLE CONDITION2
    JMP EXIT
    
    
    CONDITION2:
    CMP BL, 41H
    JGE PRINT
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
    