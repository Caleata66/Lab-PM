dosseg
.model small
.stack 100h
.data

n dw 8
buffer db 10 dup('$')

.code

iafisare proc
    mov si, offset buffer + 9 
    mov cl, '$' 
    mov [si], cl

    mov cl, 0
    cmp ax, 0
    jge conv
    neg ax
    mov cl, 1

    iconv:
    dec si
    xor dx, dx
    mov bx,10
    div bx
    add dl,30h
    mov [si],dl
    cmp ax, 0
    jne iconv

    cmp cl, 0
    je iprint
    dec si
    mov bl, '-'
    mov [si], bl

    iprint: mov dx, si
    mov ah,9
    int 21h

    mov dl, ' '
    mov ah,2
    int 21h

    mov ax, 0

    ret
iafisare endp

afisare proc
    mov si, offset buffer + 9 
    mov cl, '$' 
    mov [si], cl

    conv:
    dec si
    xor dx, dx
    mov bx,10
    div bx
    add dl,30h
    mov [si],dl
    cmp ax, 0
    jne conv

    print: mov dx, si
    mov ah,9
    int 21h

    mov dl, ' '
    mov ah,2
    int 21h

    mov ax, 0

    ret
afisare endp

main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, 1

    l: mov cx, n
    cmp cx, 0
    je p
    imul cx
    mov bx, n
    dec bx
    mov n, bx
    jmp l

    p: call afisare


    final: mov ah,4ch
    int 21h
    


main endp
end main