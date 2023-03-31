include "emu8086.inc"
code segment
    assume cs:code, ds:code, ss:code 
    mov cx, 2
    mov si, 0
    l1:
    mov ax, word[si]
    mov bl, al
    push bx
    inc si
    loop l1
    
    
    mov si, 2 
    mov cx, 2
    l2:
    pop ax
    mov bx, word[si]
    xor bh, bh
    cmp ax, bx
    jne pn
    inc si
    loop l2:
    print "Palindrome"
    jmp exit
    
    pn:
    print "Not palindrome" 

    exit:
    hlt 
    
    word db "1001"
    code ends
end