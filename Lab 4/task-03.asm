.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    MOV BL, 0
    MOV CX, 5
    
    START:
    CMP BL, 5
    JGE NEXT
    MOV AH, 1
    INT 21H
    INC BL
    JMP START
    
    NEXT:
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    
    SECOND:
    MOV DL, 78H
    INT 21H
    LOOP SECOND
    
    EXIT:
    HLT
    