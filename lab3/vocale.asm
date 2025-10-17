dosseg
.model small
.stack 100h
.data

output db 50 dup('$')
new_line db 10, 13, '$'

.code

main proc
    mov ax, @data
    mov ds, ax

    lea si, output
    citire: mov ah, 1
    int 21h
    cmp al, 13
    je afisare
    cmp al, 'a'
    je store
    cmp al, 'A'
    je store
    cmp al, 'e'
    je store
    cmp al, 'E'
    je store
    cmp al, 'i'
    je store
    cmp al, 'I'
    je store
    cmp al, 'o'
    je store
    cmp al, 'O'
    je store
    cmp al, 'u'
    je store
    cmp al, 'U'
    je store
    jmp citire
    store: mov [si], al
    inc si
    jmp citire
    
    afisare: lea dx, output
    mov ah, 9
    int 21h

    final: mov ah,4ch
    int 21h

main endp
end main