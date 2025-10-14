dosseg
.model small
.stack 100h
.data

x db 9
buffer db "$$$$"

.code
main proc
    mov ax, @data
    mov ds, ax

    mov si, offset buffer + 3
    mov bl, '$'
    mov [si], bl

    mov al, x
    RCR al,1
    jc f2

    f1: mov ah,0
    mov al,X
    mul al
    jmp convert

    f2:mov al,X
    mov ah,0
    mul al
    mul x
    mov bl,3
    div bl

    convert: dec si
    mov ah, 0
    mov bl,10
    div bl
    add ah,30h
    mov [si],ah
    cmp al, 0
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