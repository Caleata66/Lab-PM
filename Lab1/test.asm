dosseg
.model small
.stack 100h
.data

n1 DB "Hello World$"

.code 
main proc
    mov AX, @data
    mov DS, AX

    mov ah,9
    mov dx, offset n1
    int 21h

    mov ah,4ch
    int 21h
main endp
end main