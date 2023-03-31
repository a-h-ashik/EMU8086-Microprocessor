include "emu8086.inc"
code segment
assume cs:code, ds:code, ss:code 
    mov cl, 5
    mov ch, 5
    mov si, 0
    l1:
    mov al, arr[si]
    xor ah, ah
    push ax
    add si, 1
    dec cl
    jnz l1
    
    l2:
    pop dx
    mov ah, 2
    int 21h
    dec ch
    jnz l2
    
    exit:
    hlt 
    
    arr db "ASHIK"
    code ends
end