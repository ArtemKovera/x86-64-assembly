

section data.
    text1 db "You are allowed", 10
    text2 db "You are NOT allowed", 10

section text.
    global _start

_start:
    mov rbx, 10
    cmp rbx, 18
    jge  _printText1
    call _printText2


_printText1:
	mov rax, 1
	mov rdi, 1
	mov rsi, text1
	mov rdx, 16
	syscall
	
    mov rax, 60       
	mov rdi, 0
	syscall     

_printText2:
    mov rax, 1
    mov rdi, 1
    mov rsi, text2
    mov rdx, 20
    syscall

    mov rax, 60       
	mov rdi, 0
	syscall             
