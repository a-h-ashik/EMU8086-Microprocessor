.MODEL SMALL
.STACK 100H
.DATA
    BIN DB "1110"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV BX, 0
    MOV CX, 16
    MOV SI, 0
    
    CAL:
    XOR AX, AX
    MOV AL, BIN[SI]
    CMP AL, 0
    JE EXIT
    SUB AL, 30H
    SHL BX, 1
    OR BX, AX
    INC SI
    LOOP CAL
    
    EXIT:
    HLT