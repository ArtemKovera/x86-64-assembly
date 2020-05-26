


section .bss
    memory1 resb 100
    memory2 resb 8


section .text
    global _start

_start:
    mov rax, 100
    call _printInteger
 
    mov rax, 60
    mov rdi, 0
    syscall

_printInteger:
    mov rcx, memory1
    mov rbx, 10
    mov [rcx], rbx
    inc rcx
    mov [memory2], rcx

_loop1:
    mov rdx, 0
    mov rbx, 10
    div rbx
    push rax
    add rdx, 48
    mov rcx, [memory2]
    mov [rcx], dl
    inc rcx
    mov [memory2], rcx
    pop rax
    cmp rax, 0
    jne _loop1

_loop2:
    mov rcx, [memory2]
    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall
    mov rcx, [memory2]
    dec rcx
    mov [memory2], rcx
    cmp rcx, memory1
    jge _loop2
 
    ret


