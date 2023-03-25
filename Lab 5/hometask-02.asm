.MODEL SMALL
.STACK 100H
.DATA
    ARR DB 5 DUP(?)      
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV CL, 5H
    MOV SI, 0
    INP:
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV ARR[SI], AL
    INC SI
    DEC CL
    JNZ INP
    
    MOV CH, 4H
    
    LOOP1:
    MOV SI, 0
    MOV CL, 4H
        LOOP2:
        MOV AL, ARR[SI]
        MOV BL, ARR[SI+1]
        CMP AL, BL
        JL SKIP
        MOV [SI], BL
        MOV [SI+1], AL
        
        SKIP:
        INC SI
        DEC CL
        JNZ LOOP2
        DEC CH
        JNZ LOOP1
    
    EXIT:
    HLT
 