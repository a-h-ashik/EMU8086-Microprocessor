.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    ;MOV - store value of source indise the destination register
    ;MOV DESTINATION, SOURCE
    MOV AL, 2 ;AL = 2
    MOV BL, 4 ;BL = 4
    
    ;ADD - adds sources' value with destinations' value and stores it inside the destination register
    ADD BL, 6  ;BL = BL + 6 --> 0A
    ADD AL, BL ;AL = AL + BL --> 0C  
    
    ;SUB - subtracts sourses' value from the destination value and stores the value in the destination register
    SUB AL, 0AH ;AL = AL - 0AH --> 2
    SUB BL, 10B ;BL = BL - 10B(2H) --> 8
    
    ;INC - increases the value by 1
    INC DL ;DL = DL + 1 --> 1
    
    ;DEC - decreases the value by 1
    DEC DL ;DL = DL - 1 --> 0 
    
    ;NEG - change the sign of the number
    MOV DL, 1
    NEG DL ;DL-->FF
    ; 01H = 0000 0001 --(1's Complement)--> 1111 1110
    ; 2'S Complement
    ; 11111110
    ;       +1
    ;-----------
    ; 11111111 = FFH = -1D
    
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN