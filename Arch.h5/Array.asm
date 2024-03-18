.model small
; test commit
.data
  array dw 10 DUP(0)

.code
main PROC
    mov ax, @data
    mov ds, ax
mov ax, cx  ; ax = X
    add ax, 2   ; ax = X + 2
    mov si, dx  ; si = Y
    add si, 3   ; si = Y + 3
    imul  si
    mov ax, 2
    mov bx, 2
    mov cx, 2
    mov[array+0],0  ;saving time
    mov[array+1],1

    array_loop:
    mov si, ax

    mul ax    
    mov[array+bx], ax
    mov ax, si
    inc ax
    inc bx
    inc cx
    cmp cx, 10
    jne array_loop

   array_clear:     ;clearing
   mov[array+bx],0
   dec bx
   dec cx
   cmp cx,0
   jne array_clear

    fib_start:
    mov bx, 2
    mov cx, 2
    mov[array+0], 0   ; saving time
    mov[array+1], 1   

    fib_loop:
    mov ax, [array+bx-1]   
    add ax, [array+bx-2]
    mov [array+bx], ax    
    inc bx
    inc cx           
    cmp cx, 10            
    jne fib_loop           

    mov ax, 4C00h
    int 21h

main endp
end main
