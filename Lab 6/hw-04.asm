include "emu8086.inc"
code segment
    assume cs:code, ds:code, ss:code 
    mov di, 20 ;input 
    mov si, 0
    L1:
    mov cx, di
    sub cx, 2
    cmp cx, 0
    jle fp
    mov bl, 2

    L2:
    mov ax, di
    div bl
    cmp ah, 0
    je skip
    inc bl
    loop l2
    jmp found
    
    skip:
    cmp di, 1
    jle fp
    dec di
    jmp L1
    
    found:
    push di
    jmp skip
    
    ;forced push
    fp:
    mov ax, 2
    push ax   
    

    exit:
    hlt 

    code ends
end