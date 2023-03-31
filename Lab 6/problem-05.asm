include "emu8086.inc"
code segment
    assume cs:code, ds:code, ss:code 
    mov cx, 4
    mov ax, 1234h
    push ax 
    mov bx, 0010h
    
    l1:
    pop ax
    xor dx, dx
    div bx
    push ax
    mov ah, 2 
    add dx, 30h
    int 21h
    loop l1

    exit:
    hlt 
    
    ten dw 0010h
    code ends
end