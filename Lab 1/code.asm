.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    ;task 01
    MOV AX, 5
    MOV BX, AX
    
    ;task 02
    MOV AX, 300
    MOV BX, 256
    MOV CX, AX ;temp, CX = AX
    MOV AX, BX ;AX = BX
    MOV BX, CX ;BX = temp --> BX = AX
    
    ;task 03
    MOV AX, 100
    MOV BX, 200
    ADD AX, BX ; AX + BX = 01C8H(300D)
    
    ;task 04
    MOV AX, 200
    MOV BX, 100
    SUB AX, BX ;AX - BX = 64H(100). We were supposed to get a negative result. But we got positive result.
    
    ;task 05
    MOV AX, 2
    MOV BX, 4
    ADD AX, BX ;AX + BX --> AX = 6
    SUB BX, AX ;BX - AX --> BX = -2
    NEG BX ;BX = 2
    SUB AX, BX ;AX - BX --> AX = 4
    
    ;task 06
    ;i. A = B - A
    MOV AX, 10
    MOV BX, 20
    SUB BX, AX
    MOV AX, BX
    
    ;ii. A = -(A+1)
    ADD AX, 1
    NEG AX
    
    ;iii. C = A + (B+1)
    MOV AX, 2
    MOV BX, 3
    INC BX
    ADD AX, BX
    MOV CX, AX  
    
    ;iv. A = B - (A-1)
    MOV AX, 2
    MOV BX, 3
    DEC AX
    SUB BX, AX
    MOV AX, BX
    
    ;task 07
    ;i. X * Y (8 bit operands)
    MOV AL, 1FH
    MOV BL, 1FH
    MUL BL ;result AX = 3C1H
    
    ;i. X * Y (16 bit operands)
    MOV AX, 1ABCH
    MOV BX, 1122H
    MUL BX ; result --> high portion, DX = 01CAH and lower portion AX = 08F8H 
    
    ;ii. X / Y (8 bit divisor and 16 bit dividend)
    MOV AX, 3C1H
    MOV BL, 1FH
    DIV BL ;result, AL = 1FH and remainder, AH = 0
    
    ;ii. X / Y (16 bit divisor and 32 bit dividend)
    MOV DX, 01CAH
    MOV AX, 08F8H
    MOV BX, 1ABCH
    DIV BX ;result, AX = 1122H and reaminder, DX = 0
    
    ;iii. X * Y / Z
    MOV AL, 2
    MOV BL, 2
    MOV CL, 4
    MUL BL ;AL * BL --> AX = 4H
    DIV CL ;AX / CL --> result, AL = 1H and remainder, AH = 0
    
    ;task 08
    ;i. 236DF * AF
    ;Not possible. Reason is we can not store more than 16 bit in a register. First operand is more than 16 bit.
    
    ;ii. 8A32F4D5 / C9A5
    MOV DX, 8A32H
    MOV AX, 0F4D5H
    MOV BX, 0C9A5H
    DIV BX
    
    ;iii. CA92 * BAF9
    MOV AX, 0CA92H
    MOV BX, 0BAF9H
    MUL BX ;result, DX:AX = 93F3H:1C02H
    
    ;iv. CA22 * ABCD / BED
    MOV AX, 0CA22H
    MOV BX, 0ABCDH
    MUL BX ;result DX:AX = 87A6H:933AH
    MOV BX, 0BEDH
    ;DIV BX ;result AX = B5FE4 and remainder DX = 126
    ;Not possible. The reason is B5FE4 is more than 16 bit
    
    ;task 09
    ;memory registers
    ;MOV AX, BX
    ;MOV BX, CX
    
    ;MOV DS, AX
    ;MOV CS, BX
    
    ;MOV DI, AX
    ;MOV SI, BX
    
    ;segment registers
    ;MOV AX, DS
    ;MOV BX, CS
    
    ;MOV DI, DS
    ;MOV SI, CS
    
    ;memory location
    ;MOV AX, SI
    ;MOV BX, DI
    
    ;MOV DS, SI
    ;MOV CS, DI
    
    ;task 10
    ;general registers
    ;ADD AX, BX
    ;ADD AX, CX
    ;ADD DI, AX
    ;ADD SI, BX
    
    ;SUB AX, BX
    ;SUB AX, CX
    ;SUB DI, AX
    ;SUB SI, BX        
    
    ;memory location
    ;ADD DI, AX
    ;ADD SI, BX
    
    ;SUB DI, AX
    ;SUB SI, BX
    
    ;task 11
    MOV AX, 1
    MOV BX, 2
    ADD AX, BX ; (1+2) = 3
    MOV CX, AX
    
    MOV AX, 3
    MOV BX, 1
    SUB AX, BX ; (3-1) = 2
    
    MUL CX ; (2*3) = 6
    
    MOV BX, 5
    DIV BX ; (6/5)
    MOV CX, AX   
    
    MOV AX, 1
    MOV BX, 2
    MUL BX ; (1*2)
    NEG AX ; -(1*2)
    
    ADD AX, 3
    ADD AX, 2
    ADD AX, CX
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN