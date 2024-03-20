.MODEL SMALL
.STACK 100H

.DATA
    

.CODE
    MAIN PROC       ;В теорії і на практиці працює, але чомусь при повторі циклу програма зупиняється
        MOV AX, @DATA
        MOV DS, AX
        
        mov ax, 3          
        mov bx, 3
        
        call Euclid
        
        mov ah, 4CH        
        int 21H
        
    MAIN ENDP
    

    Euclid PROC   
        
    EuclidLoop:
        cmp ax, bx      
        jb SwapValues     
        div bx             
        test dx, dx         
        JNZ EuclidLoop    
        mov ax,bx         
        JMP Done            
    SwapValues:
        xchg ax, bx        
        jmp EuclidLoop     
    
    Done:
        ret
    Euclid ENDP
    
END MAIN
