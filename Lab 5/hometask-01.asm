.MODEL SMALL
.STACK 100H 
INCLUDE 'EMU8086.INC'
.DATA
    ARR DB 20 DUP(?)
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    PRINT "ENTER LENGTH: "
    MOV AH, 1
    INT 21H
    MOV CL, 1H
    MUL CL
    MOV CX, AX
    SUB CX, 30H
    MOV BX, CX
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    PRINT "INPUTS: "
    
    LEA SI, ARR
    ARRAY_IN:
    MOV AH, 1
    INT 21H
    MOV [SI], AL
    INC SI
    LOOP ARRAY_IN 
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    PRINT "OUTPUTS: "
    
    MOV CX, BX
    MOV SI, 0
    ARRAY_OUT:
    MOV DL, ARR[SI]
    INT 21H
    INC SI
    LOOP ARRAY_OUT
    
    
    
    EXIT:
    HLT