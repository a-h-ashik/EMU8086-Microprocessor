.MODEL SMALL
.STACK 100H
.DATA
    ARR DB 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV CX, 15
    MOV AH, 2
    MOV SI, 14
    
    ARRAY:
    CMP SI, 0
    JL EXIT
    MOV DL, ARR[SI]
    ADD DL, 30H
    INT 21H
    SUB SI, 3
    LOOP ARRAY
    
    EXIT:
    HLT