dosseg
.model small
.stack 100h
.data

a db 0
b db 0
buffer db 10 dup('$')
aux1 db 0
aux2 db 0
n1 DB "Introduceti primul numar: $"
n2 DB "Introduceti al doilea numar: $"
n3 DB "Cel mai mare divizor comun: $"
n4 DB "Cel mai mic multiplu comun: $"


.code

new_line proc
    MOV AH, 2
    MOV DL, 10 
    INT 21H
    ret
new_line endp

citire proc
    mov bx, 0

    cifra:mov ah, 1
    int 21h
    cmp al, 13
    je stop
    sub al, '0'
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

    mov dx, offset n1
    mov ah,9
    int 21h

    call citire
    mov a, bl
    mov aux1, bl

    mov dx, offset n2
    mov ah,9
    int 21h

    call citire
    mov b, bl
    mov aux2, bl

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

    mov dx, offset n3
    mov ah,9
    int 21h

    mov ax, 0
    mov al, a
    mov cl, 0
    
    call afisare
    call new_line

    mov dx, offset n4
    mov ah,9
    int 21h

    mov ax, 0 
    mov al, aux1
    mov bl, aux2
    mul bx
    mov bl, a
    div bx
    
    call afisare

    mov ah,4ch
    int 21h
    


main endp
end main