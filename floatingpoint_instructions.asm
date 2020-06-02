
; nasm program demonstrating most important assemply floating point instructions

section .data
    
    spVar1 dd 11.12  ; single-precision (32-bit) floating-point variable
    spVar2 dd 18.00  ; single-precision (32-bit) floating-point variable
    spVar3 dd 0.00   ; single-precision (32-bit) floating-point variable
    spVar4 dd 100.00 ; single-precision (32-bit) floating-point variable

    dpVar1 dq 10.00  ; double-precision (64-bit) floating-point variable
    dpVar2 dq 11.14  ; double-precision (64-bit) floating-point variable
    dpVar3 dq 0.00   ; double-precision (64-bit) floating-point variable
    dpVar4 dq 121.00 ; double-precision (64-bit) floating-point variable

    text db "Program completed!", 10

section .text
	global _start

_start:    
    ; Move Floating-Point Instructions

    ; 1) move 32-bit floating-point source operand to 32-bit floating-point destination operand:
    movss xmm0, dword [spVar1]
    movss xmm1, dword [spVar2]
    movss xmm12, dword [spVar4]

    ; 2) move 64-bit floating-point source operand to 64-bit floating-point destination operand:
    movsd xmm2, qword [dpVar1]
    movsd xmm3, qword [dpVar2]
    movsd xmm13, qword [dpVar4]

    ; -------------------------------------------------

    ; Floating-Point Conversion Instructions

    ; 1) convert 32-bit floating-point source operand to 64-bit floating-point destination operand:
    cvtss2sd xmm4, xmm0
    cvtss2sd xmm5, xmm1

    ; 2) convert 64-bit floating-point source operand to 32-bit floating-point destination operand:
    cvtsd2ss xmm6, xmm2
    cvtsd2ss xmm7, xmm3
    
    ; 3) convert 32-bit floating-point source operand to 32-bit integer destination operand:
    cvtss2si eax, xmm0
    cvtss2si ebx, xmm1

    ; 4) convert 64-bit floating-point source operand to 32-bit integer destination operand:
    cvtsd2si ecx, xmm2
    cvtsd2si edx, xmm3

    ; 5) convert 32-bit integer source operand to 32-bit floating-point destination operand:
    cvtsi2ss xmm8, eax
    cvtsi2ss xmm9, ebx

    ; 6) convert 32-bit integer source operand to 64-bit floating-point destination operand:
    cvtsi2sd xmm10, ecx
    cvtsi2sd xmm11, edx

    ; -------------------------------------------------
    
    ; Floating-Point Addition

    ; 1) add two 32-bit floating-point operands:
    addss xmm6, xmm0
    addss xmm7, xmm1

    ; 2) add two 64-bit floating-point operands:
    addsd xmm4, xmm2
    addsd xmm5, xmm3
    
    ; -----------------------------------------------
    
    ; Floating-Point Subtruction

    ; 1) subtract two 32-bit floating-point operands:
    subss xmm6, xmm0
    subss xmm7, xmm1

    ; 2) subtruct two 64-bit floating-point operands:
    subsd xmm4, xmm2
    subsd xmm5, xmm3

    ; ----------------------------------------------

    ; Floating-Point Multiplication

    ; 1) multiply two 32-bit floating-point operands:
    mulss xmm6, xmm0
    mulss xmm7, xmm1

    ; 2) multiply two 64-bit floating-point operands:
    mulsd xmm4, xmm2
    mulsd xmm5, xmm3

    ; ----------------------------------------------
    
    ; Floating-Point Division
    
    ; 1) divide two 32-bit floating-point operands:
    divss xmm6, xmm0
    divss xmm7, xmm1

    ; 2) divide two 64-bit floating-point operands:
    divsd xmm4, xmm2
    divsd xmm5, xmm3
    
    ; -----------------------------------------------
    
    ; Floating-Point Square Root

    ; 1) take the square root of the 32-bit floating-point source operand:
    sqrtss xmm14, xmm12

    ; 2) take the square root of the 64-bit floating-point source operand:
    sqrtsd xmm15, xmm13

    ; -----------------------------------------------

    ; Floating-Point Comparison

    ; 1) compare two 32-bit floating-point operands:
    ucomiss xmm0, xmm1

    ; 2) compare two 64-bit floating-point operands:
    ucomisd xmm2, xmm3

    ; -----------------------------------------------
    
    mov rax, 1       
    mov rdi, 1
    mov rsi, text
    mov rdx, 19
    syscall           

    mov rax, 60       
    mov rdi, 0
    syscall          






