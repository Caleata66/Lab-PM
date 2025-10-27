dosseg
.model small
.stack 100h
.data

x db 0
buffer db 10 dup('$')
n db "Introduceti un numar: $"

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

main proc
    mov ax, @data
    mov ds, ax

    mov dx, offset n
    mov ah,9
    int 21h

    call citire

    mov x, bl
    mov al, bl
    mov bl,2
    div bl
    cmp ah,1
    je f2

    f1:mov al,X
    mul al
    call afisare
    jmp final

    f2:mov al,X
    mov dx, 0
    mov ah,0
    mul ax
    mov bl,x
    mul bx
    mov bx,3
    div bx
    call afisare

    final: mov ah,4ch
    int 21h
    


main endp
end main