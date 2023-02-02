.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    ;multiply two n bit number will result a 2n bit number
    ;there are two types of multiplication
    ;   i. byte multiplication - result will be 16 bit
    ;   ii. word multiplication - result will be 32 bit
    
    ;byte multiplication
    ;must store one number in AL register
    ;store another number in any other register
    ;result will be stored in AX register
    MOV AL, 12H
    MOV BL, 12H
    MUL BL ;AX = AL * BL --> 01 44
    
    ;word multiplication
    ;must store one number in AX register
    ;store another number in any other register
    ;result will be stored in two register. higher portion in DX and lower portion in AX
    MOV AX, 1234H
    MOV BX, 0AAAAH
    MUL BX ;AX * BX --> 0C229E88 --> DX = 0C22H, AX = 9E88H
    
    EXIT:
    MOV AH, 4CH
    INT 21
    MAIN ENDP
END MAIN
    