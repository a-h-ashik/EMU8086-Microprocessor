.MODEL SMALL
.STACK 21H
.DATA
    INP_MSG1 DB "Please insert a character: $"
    INP_MSG2 DB "Please enter a number: $"
    OUT_MSG DB "Result: $"
.CODE
MAIN PROC
    ;INITIALIZING
    MOV AX, @DATA
    MOV DS, AX
    
    ;TASK 01 
    LEA DX, INP_MSG1
    MOV AH, 9
    INT 21H
    
    ;taking input
    MOV AH, 1
    INT 21H
    
    ;displaying
    MOV DL, AL
    MOV AH, 2
    INT 21H
    
    ;TASK 02
    LEA DX, INP_MSG2
    MOV AH, 9
    INT 21H
    
    ;taking first number
    MOV AH, 1
    INT 21H
    SUB AL, 30H ;CONVERTING THE GIVEN NUMBER TO APPROPIATE HEX
    MOV BH, AL
    
    ;new line
    MOV DL, 0DH
    MOV AH, 2
    INT 21H
    MOV DL, 0AH
    MOV AH, 2
    INT 21H
    
    LEA DX, INP_MSG2
    MOV AH, 9
    INT 21H
    
    ;taking second number
    MOV AH, 1
    INT 21H
    SUB AL, 30H ;CONVERTING THE GIVEN NUMBER TO APPROPIATE HEX
    MOV BL, AL
    
    ;A + B
    MOV CH, BH
    MOV CL, BL
    ADD CH, CL
    
    ;new line
    MOV DL, 0DH
    MOV AH, 2
    INT 21H
    MOV DL, 0AH
    MOV AH, 2
    INT 21H
    
    LEA DX, OUT_MSG
    MOV AH, 9
    INT 21H
    
    ;displaying result
    MOV DL, CH
    ADD DL, 30H ;COVERTING BACK TO RESPECTIVE HEX OF ASCII FORM
    MOV AH, 2
    INT 21H
    
    ;A - B
    MOV CH, BH
    MOV CL, BL
    SUB CH, CL
    
    ;new line
    MOV DL, 0DH
    MOV AH, 2
    INT 21H
    MOV DL, 0AH
    MOV AH, 2
    INT 21H
    
    LEA DX, OUT_MSG
    MOV AH, 9
    INT 21H
    
    ;displaying result
    MOV DL, CH
    ADD DL, 30H ;COVERTING BACK TO RESPECTIVE HEX OF ASCII FORM
    MOV AH, 2
    INT 21H
    
    ;A * B
    MOV AL, BH
    MUL BL
    ADD AX, 30H ;COVERTING BACK TO RESPECTIVE HEX OF ASCII FORM
    MOV CX, AX
    
    MOV DL, 0DH
    MOV AH, 2
    INT 21H
    MOV DL, 0AH
    MOV AH, 2
    INT 21H
    
    LEA DX, OUT_MSG
    MOV AH, 9
    INT 21H
    
    ;displaying result
    MOV DX, CX
    MOV AH, 2
    INT 21H
    
    ;A / B
    MOV AL, BH
    MOV AH, 0H
    DIV BL
    MOV CL, AL
    
    ;new line
    MOV DL, 0DH
    MOV AH, 2
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    LEA DX, OUT_MSG
    MOV AH, 9
    INT 21H
    
    displaying result
    MOV DL, CL
    ADD DL, 30H ;COVERTING BACK TO RESPECTIVE HEX OF ASCII FORM
    MOV AH, 2
    INT 21H
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    
    
    
    