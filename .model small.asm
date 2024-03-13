.model small

.data
    array dw 20*5 DUP(0) ; 20x5 двовимірний масив

.code
main PROC
    mov ax, @data
    mov ds, ax 

    mov ch,0 ; Line = X
    mov cl,0 ; Colomn = Y
main_loop:
  
    mov al,ch
    add al,2
    mov bl,cl
    add bl,3
    imul bl

    mov bx,ax
    mov ax,5
    mul ch
    mov dl,cl
    xor dh,dh
    add ax,dx
    shl ax,1
    xchg ax,bx
    mov[array+bx],ax
    inc cl
    cmp cl,20
    jne main_loop
    mov cl,0
    inc ch
    cmp ch,5
    jne main_loop
    jmp final



final:
    mov ax, 4C00h
    int 21h

main endp
end main

   