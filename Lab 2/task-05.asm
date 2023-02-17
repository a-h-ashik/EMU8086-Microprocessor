.MODEL SMALL
.STACK 100H
.DATA
    FN DB "FIRST NUMBER: $"
    SN DB "SECOND NUMBER: $"
    SUM DB "SUM: $"
.CODE
MAIN PROC
    ;INITIALIZING
    MOV AX, @DATA
    MOV DS, AX
    
    ;A
    MOV AH, 2
    MOV DL, '?'
    INT 21H
    
    ;B
    ;taking first number
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV BH, AL
    
    ;taking second number
    INT 21H
    SUB AL, 30H
    MOV BL, AL
    
    ;new line
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    LEA DX, FN
    MOV AH, 9
    INT 21H
    MOV AH, 2
    MOV DL, BH
    ADD DL, 30H
    INT 21H
    
    ;new line
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    LEA DX, SN
    MOV AH, 9
    INT 21H
    MOV AH, 2
    MOV DL, BL
    ADD DL, 30H
    INT 21H
    
    ;new line
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    LEA DX, SUM
    MOV AH, 9
    INT 21H
    ADD BH, BL
    MOV AH, 2
    MOV DL, BH
    ADD DL, 30H
    INT 21H
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN