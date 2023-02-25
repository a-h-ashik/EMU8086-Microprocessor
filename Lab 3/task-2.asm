.MODEL SMALL
.STACK 100H
.DATA
    A DB "AL COMES FIRST$" 
    B DB "BL COMES FIRST$"
      
      
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    
    MOV AL, 6H
    MOV BL, 1H
    
    CMP AL, BL
    JG BL_FIRST
    ;ELSE:
    MOV AH, 9
    LEA DX, A
    INT 21H
    
    BL_FIRST:
    MOV AH, 9
    LEA DX, B
    INT 21H
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    