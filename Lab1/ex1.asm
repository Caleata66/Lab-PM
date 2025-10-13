dosseg
.model small
.stack 100h
.data

    A DB 0
    B DB 0
    C DB 0
    X DW 7

    n1 DB "Introduceti primul numar:$"
    n2 DB "Introduceti al doilea numar:$"
    n3 DB "Introduceti al treilea numar:$"
    result DB "Rezultatul:$"
    nu_e_cifra DB "Nu e cifra$"

.code 
new_line proc
    MOV AL,2
    MOV DL,10
    int 21h
    ret 
new_line endp

main proc
    mov AX, @data
    mov DS, AX

    mov AH,9
    mov DX, OFFSET n1
    int 21h
    mov AH,1
    int 21h
    cmp AL, 30h
    jl error
    cmp AL,39h
    jg error
    sub al, 30h
    mov A, Al
    call new_line

    mov AH,9
    mov DX, OFFSET n2
    int 21h
    mov AH,1
    int 21h
    cmp AL, 30h
    jl error
    cmp AL,39h
    jg error
    sub al, 30h
    mov B, Al
    call new_line

    mov AH,9
    mov DX, OFFSET n3
    int 21h
    mov AH,1
    int 21h
    cmp AL, 30h
    jl error
    cmp AL,39h
    jg error
    sub al, 30h
    mov C, Al
    call new_line
    jmp prg

    error: call new_line
    mov AH,9
    mov dx,offset nu_e_cifra
    int 21h
    jmp final

    prg: mov AH, 9
    mov dx, offset result
    int 21h

    mov AL, A
    add AL, B
    sub AL, C
    add AL, 30h

    mov AH, 2
    mov DL, AL
    int 21h

    final: mov ah, 4ch
    int 21h
main endp
end main

