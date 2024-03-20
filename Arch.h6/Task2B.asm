.model small

.data
    array dw 20*5 DUP(0)

.code

calculate_value PROC    
         
    mov ax, cx     
    add ax, 2       
    mov bx, dx 
    push bx    
    add bx, 3 
    push dx      ; Зберегаю dx бо після множення він обнуляється
    imul bx         

     pop dx      
    pop bx         
    ret             
calculate_value ENDP


write_to_array PROC
;Той самий код для визначення адреси подвійного масиву але з запамятовуванням dx
    mov bx,ax
    mov ax,5
    mul ch 
    push dx
    mov dl,cl
   
    xor dh,dh
    add ax,dx
    shl ax,1
    xchg ax,bx
    mov[array+bx],ax
    pop dx
    

    ret
write_to_array ENDP

main PROC
    mov ax, @data
    mov ds, ax 

    mov cx, 0       ; X
    mov dx, 0       ; Y

main_loop:
    call calculate_value    ; Розрахунок (X+2)*(Y+3)
    call write_to_array     ; Запис у масив

    inc dx        
    cmp dx, 5      
    jne main_loop

    inc cx          
    mov dx, 0      
    cmp cx, 20      
    jne main_loop

final:
    mov ax, 4C00h
    int 21h

main endp
end main
