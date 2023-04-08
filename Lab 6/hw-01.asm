include "emu8086.inc"
code segment
    assume cs:code, ds:code, ss:code 
    mov ah, 1
    int 21h     ;input 1 to 9
    sub al, 30h
    mov bl, al
    
    mov cl, 1 
    mov di, 0
    L1:
    cmp cl, bl
    jg Exit
    
    xor ax, ax
    mov al, bl
    div cl
    cmp ah, 0
    jne nx
    push cx
    inc di
    
    nx:
    inc cl
    jmp L1
    
    exit:
    hlt 
    
    code ends
end