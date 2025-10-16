dosseg
.model small
.stack 100h
.data

n db 14
cnt db 0
a db 0
b db 1
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

main proc
    mov ax, @data
    mov ds, ax

    mov al, n
    sub al, 2
    mov cnt, al

    mov ah, 0
    mov al, B
    call afisare

    l:
    mov al, C
    rcr al, 1
    jnc f
    mov ah, 0
    mov al, c
    call afisare

    f:mov al, C
    mov a, al
    add al, B
    mov c, al
    mov al, A
    mov b, al
    mov cl, cnt
    dec cl
    mov cnt, cl
    cmp cl, 0
    jne l



    final: mov ah,4ch
    int 21h
    


main endp
end main