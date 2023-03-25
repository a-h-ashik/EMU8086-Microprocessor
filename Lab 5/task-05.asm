.MODEL SMALL
.STACK 100H
.DATA
    ARR DB 1, 5, 9, 15, 20
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ;INDEX --> BL
    MOV AH, 1
    INT 21H
    MOV BL, 1H
    MUL BL
    MOV CX, AX
    SUB CX, 30H 
         
    ;VALUE --> BH
    MOV AH, 1
    INT 21H
    MOV BL, AL
    SUB BL, 30H
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV SI, 0
    ARRAY:
    CMP SI, CX
    JNE SKIP
    
    MOV DL, ARR[SI]
    ADD DL, BL
    ADD DL, 30H
    INT 21H
    JMP EXIT 
    
    SKIP:
    INC SI
    JMP ARRAY
    
    
    EXIT:
    HLT