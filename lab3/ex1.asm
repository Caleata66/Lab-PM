dosseg
.model small
.stack 100h
.data

string db 0

.code
main proc
    mov ax, @data
    mov ds, ax

    lea si, string

    citire: mov ah, 1
    int 21h

    cmp al, 13
    je afisare

    cmp al, 'a'
    jb caracter
    cmp al, 'z'
    ja caracter

    sub al, 32
    caracter: mov [si], al
    inc si
    jmp citire

    afisare:
    mov bl, '$'
    mov [si], bl 
    lea dx, string
    mov ah, 9
    int 21h

    final: mov ah,4ch
    int 21h

main endp
end main