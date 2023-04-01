include "emu8086.inc"
code segment
    assume cs:code, ds:code, ss:code 
    ;sorting array
    mov ch, 5 ;lenght - 1 of the array
    L1:
        mov cl, 5 ;lenght - 1 of the array
        mov si, 0
        L2:
        mov ah, string[si]
        mov al, string[si+1]
        cmp ah, al
        jg swap
        inc si
        dec cl
        jnz L2
    dec ch    
    jnz L1
    jmp next
    
    swap:
    mov string[si], al
    mov string[si+1], ah
    inc si
    dec cl
    jnz L2
    
    ;duplicate check
    next:
    mov cx, 5 ;lenght - 1 of the array
    mov si, 0
    xor ah, ah
    mov al, string[si]
    push ax
    xor di, di

    dc:
    cmp cx, 0
    je dup_nf  
    inc si
    dec cx
    xor ah, ah
    mov al, string[si]
    pop bx
    push bx
    cmp ax, bx
    je found_dup
    push ax
    jmp dc
    
    dup_nf:
    cmp di, 1
    je exit
    print "Unique"
    jmp exit
    
    
    found_dup:
    cmp di, 1
    je dc
    print "Not Unique"
    mov di, 1
    jmp dc
    

    exit:
    hlt 
    
    string db "ASHIKK"
    code ends
end