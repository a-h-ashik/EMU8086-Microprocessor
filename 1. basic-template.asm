.MODEL SMALL ;you intend to use the small memory model - one code segment, one data segment and one stack segment
.STACK 100H  ;this indicates the size of the memory within the stack
.DATA
    ;define your variable here
.CODE ;code segment starts here
MAIN PROC ;write all code into this block
    ;initialize all the variables
    MOV AX, @DATA
    MOV DS, AX
    ;write code here
    
    
    EXIT:
    MOV AX, 4C00H
    INT 21H ;interrupt function
    MAIN ENDP
END MAIN
