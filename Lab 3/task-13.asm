.MODEL SMALL
.STACK 100H
.DATA
    SA DB "SATURDAY$"
    SU DB "SUNDAY$"
    MO DB "MONDAY$"
    TU DB "TUESDAY$"
    WE DB "WEDNESDAY$"
    TH DB "THURSDAY$"
    FR DB "FRIDAY$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 1
    INT 21H        
    MOV BL, AL
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    IF1:
    CMP BL, 31H
    JE PRINT_SA
    
    IF2:
    CMP BL, 32H
    JE PRINT_SU
    
    IF3:
    CMP BL, 33H
    JE PRINT_MO
    
    IF4:
    CMP BL, 34H
    JE PRINT_TU
    
    IF5:
    CMP BL, 35H
    JE PRINT_WE
    
    IF6:
    CMP BL, 36H
    JE PRINT_TH
    
    IF7:
    CMP BL, 37H
    JE PRINT_FR
    
    PRINT_SA:
    MOV AH, 9
    LEA DX, SA
    INT 21H
    JMP EXIT 
    
    PRINT_SU:
    MOV AH, 9
    LEA DX, SU
    INT 21H
    JMP EXIT
    
    PRINT_MO:
    MOV AH, 9
    LEA DX, MO
    INT 21H
    JMP EXIT 
    
    PRINT_TU:
    MOV AH, 9
    LEA DX, TU
    INT 21H
    JMP EXIT
    
    PRINT_WE:
    MOV AH, 9
    LEA DX, WE
    INT 21H
    JMP EXIT  
    
    PRINT_TH:
    MOV AH, 9
    LEA DX, TH
    INT 21H
    JMP EXIT
              
    PRINT_FR:
    MOV AH, 9
    LEA DX, FR
    INT 21H
    JMP EXIT
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
    