.MODEL SMALL
.STACK 100H
.DATA
    ARR DB "ABID HOSSAIN"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ;TASK 3
    MOV CX, 12
    MOV AH, 2
    MOV SI, 0
    
    ARRAY:
    MOV DL, ARR[SI]
    INT 21H
    INC SI
    LOOP ARRAY
     
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H 
     
    ;TASK 4
     MOV CX, 12
    MOV AH, 2
    MOV SI, 11
    
    ARRAY2:
    MOV DL, ARR[SI]
    INT 21H
    DEC SI
    LOOP ARRAY2
    
    EXIT:
    HLT