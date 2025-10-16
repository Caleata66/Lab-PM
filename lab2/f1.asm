dosseg
.model small
.stack 100h
.data

x db 38
buffer db 10 dup('$')

.code

afisare proc
    conv: dec si
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

    ret
afisare endp

main proc
    mov ax, @data
    mov ds, ax

    mov si, offset buffer + 8

    mov al, x
    RCR al,1
    jc f2

    f1:mov al,X
    mul al
    mov bl, x
    add ax, bx
    add ax, 5
    call afisare
    jmp final

    f2:mov al,X
    mov dx, 0
    mov ah,0
    mul ax
    mov bl,x
    mul bx
    sub ax, bx
    call afisare

    final: mov ah,4ch
    int 21h
    


main endp
end main