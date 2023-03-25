CODE SEGMENT
    ASSUME CS:CODE,DS:CODE
    
    MOV SI, 0
    
    L1:
    MOV BX, 0
    
    L2:
    MOV DI, 0
    MOV BP, 0
    MOV TEMP, 0
    
    L3:
    MOV AL, A[BP+SI]
    MUL B[BX+DI]
    ADD TEMP, AL
    INC BP
    ADD DI, 3
    CMP DI, 9
    JL L3
    
    MOV AL, TEMP
    MOV C[BX+SI], AL
    INC BX
    CMP BX, 3
    JL L2
    
    ADD SI, 3
    CMP SI, 9
    JL L1
    
    EXIT:
    HLT  
    
    A DB 1,2,3
      DB 1,2,1
      DB 7,1,5
     
    B DB 4,5,6
      DB 1,0,8
      DB 1,3,0
      
    C DB 3 DUP(0)
      DB 3 DUP(0)
      DB 3 DUP(0)
      
    TEMP DB 0
 