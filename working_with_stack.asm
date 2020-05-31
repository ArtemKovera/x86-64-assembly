; simle nasm program demonstrating push and pop assembly directives

section .data
    items   dq 1, 2, 3, 4, 5, 6, 7



section .bss
    memory1 resb 100
    memory2 resb 8    

section .text
    global _start

_start:
    
    ;loop to put numbers on stack

    mov rcx, 0      ; loop counter for the pushItems loop
    mov rbx, items  ; memory addres of the data
    mov r12, 0      ; loop counter for the popItems loop

pushItems:          ; in this loop items are pushed on stack
    push  qword [rbx + rcx * 8]
    inc rcx
    cmp rcx, 7  
    jl pushItems
    
    mov r12, 0

popItems:            ; in this loop items are poped and printed to the console in reverse order
    pop rax
    call _printInteger
    inc r12
    cmp r12, 7
    jl popItems


    mov rax, 60       
    mov rdi, 0
    syscall    

; subroutine for printing integers to the console
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
    