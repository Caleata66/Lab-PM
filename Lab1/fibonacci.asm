dosseg
.model small
.stack 100h

.data

A db 0
B db 1
C db 1
cnt db 4

.code
main proc
    mov ax, @data
    mov ds,ax

    mov al,A
    add al,30h
    mov ah,2
    mov dl,al
    int 21h
    
    mov al,B
    add al, 30h
    mov ah,2
    mov dl,al
    int 21h

    afisare:mov al,C
    add al, 30h
    mov ah,2
    mov dl,al
    int 21h

    mov al,c
    mov a, al
    add al,B
    mov c,al
    mov al,a
    mov b,al
    mov al,cnt
    sub al,1
    cmp al,0
    jl final
    mov cnt,al
    jmp afisare

    final:mov ah, 4ch
    int 21h
main endp
end main