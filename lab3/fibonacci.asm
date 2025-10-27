dosseg
.model small
.stack 100h
.data

cnt db 0
a dw 0
b dw 1
c dw 1
buffer db 10 dup('$')
s db "Introduceti un numar: $"

.code

citire proc
    mov bx, 0

    cifra:mov ah, 1
    int 21h
    cmp al, 13
    je stop
    sub al, 30h
    mov cl, al
    mov al, bl
    mov dl, 10
    mul dl
    add al, cl
    mov bl, al
    jmp cifra
    stop: ret

citire endp

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

    mov dx, offset s
    mov ah,9
    int 21h

    call citire
    sub bl, 2
    mov cnt, bl

    mov ax, B
    call afisare

    l:
    mov ax, C
    rcr al, 1
    jnc f
    mov ax, c
    call afisare

    f:mov ax, C
    mov a, ax
    add ax, B
    mov c, ax
    mov ax, A
    mov b, ax
    mov cl, cnt
    dec cl
    mov cnt, cl
    cmp cl, 0
    jne l



    final: mov ah,4ch
    int 21h
    


main endp
end main