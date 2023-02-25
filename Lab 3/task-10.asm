.MODEL SMALL
.STACK 100H
.DATA
    O1 DB "MAX NUMBER IS $"
    O2 DB "MINIMUM NUMBER IS $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 1
    INT 21H
    MOV BH, AL ;A
    
    MOV AH, 1
    INT 21H
    MOV BL, AL ;B
    
    MOV AH, 1
    INT 21H
    MOV CL, AL ;C
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    IF1: 
    CMP BH, BL
    JG CHECK_AC
    JL CHECK_BC
    ELSE1:
    JMP EXIT
    
    CHECK_AC:
    CMP BH, CL
    JG MAX_A
    JL MAX_C
    JMP EXIT
    
    CHECK_BC:
    CMP BL, CL
    JG MAX_B
    JL MAX_C
    JMP EXIT
    
    MAX_A:
    MOV AH, 9
    LEA DX, O1
    INT 21H
    MOV AH, 2
    MOV DL, BH
    INT 21H
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    JMP IF2
    
    MAX_B:
    MOV AH, 9
    LEA DX, O1
    INT 21H
    MOV AH, 2
    MOV DL, BL
    INT 21H
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    JMP IF2
    
    MAX_C:
    MOV AH, 9
    LEA DX, O1
    INT 21H
    MOV AH, 2
    MOV DL, CL
    INT 21H
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    JMP IF2 
    
    
    ;MINIMUL CALCULATION
    IF2: 
    CMP BH, BL
    JG M_CHECK_BC
    JL M_CHECK_AC
    ELSE2:
    JMP EXIT
    
    M_CHECK_AC:
    CMP BH, CL
    JG MIN_C
    JL MIN_A
    JMP EXIT
    
    M_CHECK_BC:
    CMP BL, CL
    JG MIN_C
    JL MIN_B
    JMP EXIT
    
    MIN_A:
    MOV AH, 9
    LEA DX, O2
    INT 21H
    MOV AH, 2
    MOV DL, BH
    INT 21H
    JMP EXIT
    
    MIN_B:
    MOV AH, 9
    LEA DX, O1
    INT 21H
    MOV AH, 2
    MOV DL, BL
    INT 21H
    JMP EXIT
    
    MIN_C:
    MOV AH, 9
    LEA DX, O1
    INT 21H
    MOV AH, 2
    MOV DL, CL
    INT 21H
    JMP EXIT
    

    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    