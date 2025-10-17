dosseg
.model small
.stack 100h
.data

msg1 db 50 dup('$')
msg2 db 50 dup('$')
new_line db 10, 13, '$'

.code

citeste_string proc
    citire: mov ah,1
    int 21h
    mov [si], al
    inc si
    cmp al, '$'
    jne citire
    ret
citeste_string endp
main proc
    mov ax, @data
    mov ds, ax

    lea si, msg1
    call citeste_string

    lea si, msg2
    call citeste_string

    lea dx, new_line
    mov ah, 9
    int 21h
   
    lea dx, msg1
    mov ah, 9
    int 21h

    lea dx, msg2
    mov ah, 9
    int 21h

    final: mov ah,4ch
    int 21h

main endp
end main