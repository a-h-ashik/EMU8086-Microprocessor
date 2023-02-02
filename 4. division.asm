.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    ;there are two types of divition
    ; i. byte division - divisor 8 bit, dividend 16 bit, result 8 bit
    ; ii. word division - divisor 16 bit, dividend 32 bit, result 16 bit
    
    ;byte division
    ;store the dividend in AX register
    ;store the divisor (8 bit) in any other register
    ;result will be in AL and remainder will be in AH
    MOV AX, 301
    MOV BL, 5
    DIV BL ;AX / BL --> result, AL = 3CH(60D) and remainder, AH = 01H(1D)
    
    ;word division
    ;dividend will be 32 bit. store it as DX:AX --> higer 16 bit in DX, lower 16 bit in AX
    ;store the divisor(16 bit) in any other register
    ;result will be in AX and remainder will be in DX
    MOV DX, 1122H
    MOV AX, 3344H
    MOV BX, 0FFFFH
    DIV BX ;DX:AX / BX --> result, AX = 1122H and remainder, DX = 4466H
    
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN