; simple nasm program demonstrating list summation in assembly


section .data
    list db 10, 10, 10, 10, 10, 10, 10, 10, 10, 10   ; this array has 10 items with value 10 
    length db 10
    sum db 0

section .bss
    memory1 resb 100
    memory2 resb 8    

section .text
    global _start

_start:
    mov rcx, 0                      ; loop counter

summationLoop:
    mov al, byte [list + (rsi)]     ; get list[rsi]
    add byte [sum], al              ; update sum
    inc rcx                         ; next item in the list
    cmp rcx, 10
    jl summationLoop

    mov al, [sum]
    call _printInteger              ; 100 (10*10) must be printed to the consle

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
