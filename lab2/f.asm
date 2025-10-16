dosseg
.model small
.stack 100h
.data

x db 57
buffer db 10 dup('$')

.code
main proc
    mov ax, @data
    mov ds, ax

    mov si, offset buffer + 8
    mov bl, '$'
    mov [si], bl

    mov al, x
    mov bl,2
    div bl
    cmp ah,1
    je f2

    f1:mov al,X
    mul al
    jmp convert

    f2:mov al,X
    mov dx, 0
    mov ah,0
    mul ax
    mov bl,x
    mul bx
    mov bx,3
    div bx

    convert: dec si
    xor dx, dx
    mov bx,10
    div bx
    add dl,30h
    mov [si],dl
    cmp ax, 0
    jne convert

    mov dl, ' '
    mov ah,2
    int 21h

    mov dx, si
    mov ah,9
    int 21h

    mov ah,4ch
    int 21h
    


main endp
end main