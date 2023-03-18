.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    MOV BL, 0
    MOV AL, 3 ;M
    MOV CX, 4 ;N
    
    START:
    ADD BL, AL
    LOOP START
   
    EXIT:
    HLT
    