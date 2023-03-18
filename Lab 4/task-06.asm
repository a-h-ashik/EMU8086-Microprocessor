.MODEL SMALL
.STACK 100H
.DATA
    P1 DB "ENTER A DIGIT OR A LETTER BETWEEN [A..F]: $"
    P2 DB "ILLIGAL CHARACTER! ENTER A DIGIT OR A LETTER BETWEEN [A..F]: $" 
    P3 DB "IN DECIMAL IT IS $" 
    P4 DB "DO YOU WANT TO DO IT AGAIN? --> $"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    AGAIN:
    MOV AH, 9
    LEA DX, P1
    INT 21H
    
    START:
    MOV AH, 1
    INT 21H
    MOV BL, AL
    
    CHECK:
    CMP AL, 30H
    JL INVALID
    CMP AL, 39H
    JG CHECK2
    JMP CALC1
    
    CHECK2:
    CMP AL, 41H
    JL INVALID
    CMP AL, 46H
    JG INVALID
    JMP CALC2
    
    INVALID: 
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV AH, 9
    LEA DX, P2
    INT 21H
    JMP START
    
    CALC1:
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
    
    MOV AH, 9
    LEA DX, P3
    INT 21H
    MOV AH, 2
    MOV DL, BL
    INT 21H
    JMP QUESTION 
    
    CALC2:
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
    
    MOV AH, 9
    LEA DX, P3
    INT 21H
    MOV AH, 2
    MOV DL, 31H
    INT 21H
    MOV DL, BL
    SUB DL, 11H
    INT 21H
    
    JMP QUESTION
    
    
    QUESTION:
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
    
    MOV AH, 9
    LEA DX, P4
    INT 21H
    MOV AH, 1
    INT 21H
    
    CMP AL, 59H  
    JE NEW
    
    CMP AL, 79H
    JE NEW
    
    JMP EXIT 
     
    
    NEW:
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    JMP AGAIN
    
    EXIT:
    HLT