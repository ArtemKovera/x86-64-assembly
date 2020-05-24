; a simple nasm program for getting user input using Linux sys calls

section .data
    text1 db "What is your full name?", 32
    text2 db "Hello", 32

section .bss
    name resb 64       ; reserving 64 bytes for user input
    

section .text
    global _start

_start:

    call _printText1   ; uses sys_write
    call _getName      ; uses sys_read
    call _printText2   ; uses sys_write
    call _printName    ; uses sys_write

    mov rax, 60       
    mov rdi, 0
    syscall 


_printText1:
    mov rax, 1
    mov rdi, 1
    mov rsi, text1
    mov rdx, 24
    syscall
    ret

_getName:
    mov rax, 0
    mov rdi, 0
    mov rsi, name
    syscall
    ret

_printText2:
    mov rax, 1
    mov rdi, 1
    mov rsi, text2
    mov rdx, 6
    syscall
    ret

_printName:
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 64
    syscall
    ret








