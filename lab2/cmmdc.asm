dosseg
.model small
.stack 100h
.data

a db 48
b db 180
buffer1 db 10 dup('$')
buffer2 db 10 dup('$')
aux1 db 0
aux2 db 0

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

    mov al, a
    mov aux1, al
    mov al, b
    mov aux2, al

    w:mov al, a
    mov bl, b
    cmp al, b
    jb mai_mic

    sub al, bl
    mov a, al
    jmp cond

    mai_mic:sub bl, al
    mov b, bl

    cond: cmp al, bl
    jne w

    mov ax, 0
    mov al, a
    mov cl, 0

    mov si, offset buffer1 + 8
    call afisare

    mov ax, 0 
    mov al, aux1
    mov bl, aux2
    mul bx
    mov bl, a
    div bx

    mov si, offset buffer2 + 8
    call afisare

    mov ah,4ch
    int 21h
    


main endp
end main