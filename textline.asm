; nasm program to print a line in a console using Linux system calls

section .data
	text db "Artem Kovera is a good programmer",10  ; text line being desplayed 

section .text
	global _start

_start:
	mov rax, 1       
	mov rdi, 1
	mov rsi, text
	mov rdx, 34
	syscall           ; sys_write system call

	mov rax, 60       
	mov rdi, 0
	syscall           ; sys_exit system call