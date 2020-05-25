; simple nasm program for printing english alphabet
; uses analogy to a while loop in high-level languages 

section .data 
    result db 64, 10

section .text
    global _start

_start:
     
_loop:
    add byte [result], 1
    call _printCharacter
    
    cmp byte [result], 89
    jg _done
    
    jmp _loop

_done:
    mov rax, 60       
    mov rdi, 0
    syscall         


_printCharacter:
    mov rax, 1       
    mov rdi, 1
    mov rsi, result
    mov rdx, 2
    syscall   
    ret


