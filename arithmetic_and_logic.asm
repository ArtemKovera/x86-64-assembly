; nasm program demonstrating some assembly arithmetic and logic operations
; as well as basic working with memory

section .data
    var1 db 10     ; byte variable 
    var2 dw 20     ; word variable
    var3 dd 30     ; double-word variable
    var4 dq 40     ; quad-word variable

    var5 dd 100    ; double-word variable
    var6 db 2      ; byte variable

section .bss
    memory1 resb 100
    memory2 resb 8    

section .text
    global _start


_start:
    mov al, byte [var1]
    call _printInteger     ; 10 must be printed to the console

    mov ax, word [var2]
    call _printInteger     ; 20 must be printed to the console

    mov eax, dword [var3]
    call _printInteger     ; 30 must be printed to the console

    mov rax, qword [var4]
    call _printInteger     ; 40 must be printed to the console


    ; multiply and divide instructions
    mov rax, 100 
    mul dword [var5]       
    call _printInteger     ; 10000 must be printed (100*100)

    mov al, byte [var1]
    mov ah, 0
    mov bl, byte [var6]
    mov bh, 0    
    div bl
    call _printInteger     ; 5 must be printed (10/2)

    mov edx, 0
    mov eax, 20000
    mov ebx, [var5]
    div ebx
    call _printInteger     ; 200 must be printed (20000/100)  

    
    ; logic operations

    mov rax, 3
    mov rbx, 2
    and rax, rbx
    call _printInteger     ; 2 must be printed

    mov rax, 2
    mov rbx, 1
    or rax, rbx
    call _printInteger     ; 3 must be printed
    
    mov rax, -5
    not rax 
    call _printInteger     ; 4 must be printed

    mov rax, 4
    mov rbx, 2
    xor rax, rbx
    call _printInteger     ; 6 must be printed
    
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