dosseg
.model small
.stack 100h
.data

a db 128
b db 16
buffer1 db 10 dup('$')
buffer2 db 10 dup('$')

.code

convert proc
    conv: dec si
    xor dx, dx
    mov bx,10
    div bx
    add dl,30h
    mov [si],dl
    cmp ax, 0
    jne conv
    ret
convert endp

main proc
    mov ax, @data
    mov ds, ax

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

    mov al, a
    mov cl, 0

    mov si, offset buffer1 + 9
    mov bl, '$'
    mov [si], bl
    call convert
    jmp afisare

    cmmmc: mov al, a
    mov bl, b
    mul bx
    mov bl, a
    div bl
    mov cl, 1

    mov si, offset buffer2 + 9
    mov bl, '$'
    mov [si], bl
    call convert

    afisare: mov dl, ' '
    mov ah,2
    int 21h

    mov dx, si
    mov ah,9
    int 21h
    cmp cl, 0
    jz cmmmc

    mov ah,4ch
    int 21h
    


main endp
end main