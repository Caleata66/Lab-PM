dosseg
.model small
.stack 100h
.data
.code
main proc
    mov ax, @data
    mov ds,ax

    mov ah,1
    int 21h
    sub al,30h
    mov dh,0

    sum: add dh,al
    sub al,1
    cmp al,0
    jg sum

    mov ah,2
    mov dl,' '
    int 21h

    mov ah,2
    mov dl, dh
    add dl, 30h    ; convert sum (0-9) to ASCII before printing
    int 21h

    mov ah,4ch
    int 21h

main endp
end main
    