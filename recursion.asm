; a simple nasm program demonstrating recursion in assembly

section .data
    character db 'A'
    newLine db 10

section .text
    global _start

_start:
    mov rbx, 0

    call _recursiveFunction ; calling recursive function, which prints 'A' 10 times
    
    mov rax, 1
    mov rdi, 1
    mov rsi, newLine     ; placing new line for better readability 
    mov rdx, 1
    syscall

    mov rax, 60       
    mov rdi, 0
    syscall    

_recursiveFunction:
    mov rax, 1
    mov rdi, 1
    mov rsi, character
    mov rdx, 1
    syscall

    add rbx, 1
    cmp rbx, 10
    jne _recursiveFunction
    ret
