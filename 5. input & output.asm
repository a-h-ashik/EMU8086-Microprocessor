.MODEL SMALL
.STACK 100H
.DATA
    INP_MSG DB "ENTER A NUMBER: $"
.CODE
MAIN PROC 
    ;INITIALIZING
    MOV AX, @DATA
    MOV DS, AX
    
    
    ;TAKING INPUT
    MOV AH, 1
    INT 21H
    
    ;SHOWING OUTPUT
    MOV AH, 2
    MOV DL, 30H
    INT 21H 
    
    ;TAKE INPUT AND SHOW IT
    MOV AH, 1
    INT 21H
    
    MOV DL, AL
    MOV AH, 2
    INT 21H
    
    ;NEW LINE
    MOV DL, 0DH ;MOVE THE CURSOR AT THE BEGINING OF THE LINE
    MOV AH, 2
    INT 21H
                                                            
    MOV DL, 0AH ;GO TO NEW LINE
    INT 21H
           
    ;DISPLAYING STRING
    LEA DX, INP_MSG
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H 
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN