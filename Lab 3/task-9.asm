.MODEL SMALL
.STACK 100H
.DATA
    D DB "DIVISIBLE$"
    ND DB "NOT DIVISIBLE$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AX, 50H
    MOV CX, AX
    MOV BL, 5H
    MOV BH, 11H
    DIV BL
    
    CONDITION1:
    CMP AH, 0H
    JNE PRINT_ND
    ELSE1:
    MOV AX, CX
    DIV BH
    
    CONDITION2:
    CMP AH, 0H
    JNE PRINT_ND
    ELSE2:
    MOV AH, 9
    LEA DX, D
    INT 21H
    JMP EXIT
    
    PRINT_ND:
    MOV AH, 9
    LEA DX, ND
    INT 21H

    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    