dosseg
.model small
.stack 100h
.data

a db 1
b db 0
c db 1
buffer db 10 dup('$')

.code

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

    mov dx, si
    mov ah,9
    int 21h

    mov dl, ' '
    mov ah,2
    int 21h

    mov ax, 0

    ret
afisare endp

afisare_neg proc
    mov si, offset buffer + 9 
    mov cl, '$' 
    mov [si], cl

    conv_neg:
    dec si
    xor dx, dx
    mov bx,10
    div bx
    add dl,30h
    mov [si],dl
    cmp ax, 2
    jge conv_neg

    cmp ax, 1
    jne poz
    dec si
    mov bl, '-'
    mov [si], bl
    poz:    

    mov dx, si
    mov ah,9
    int 21h

    mov dl, ' '
    mov ah,2
    int 21h

    mov ax, 0

    ret
afisare_neg endp

main proc
    mov ax, @data
    mov ds, ax

    mov al, B
    imul al
    mov cx, ax
    mov al, A
    mov bl, 4
    imul bx
    mov bl, C
    imul bx
    sub cx, ax
    mov ax, cx
    cmp ax, 0
    js negat
    call afisare
    jmp final
    negat: call afisare_neg



    final: mov ah,4ch
    int 21h
    


main endp
end main