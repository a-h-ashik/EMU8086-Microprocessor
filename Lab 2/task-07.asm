.MODEL SMALL
.STACK 100H
.DATA
    MSG DB "ENTER A CHARACTER: $"
    MSG2 DB "IN DECIMAL IT IS $"
.CODE
MAIN PROC
    ;INITIALIZING
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, MSG
    MOV AH, 9
    INT 21H 
    
    MOV AH, 1
    INT 21H
    MOV BH, AL
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    MOV AH, 9
    LEA DX, MSG2
    INT 21H 
    
    ;first character will always 1
    MOV AH, 2
    MOV DL, 31H
    INT 21H
    
    ;subtruct 11 from the hex value of the character
    MOV DL, BH
    SUB DL, 11H
    INT 21H 
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN