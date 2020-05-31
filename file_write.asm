; nasm program demonstrating how to create and write to a file with assembly in Linux
; this program is from the open book "x86-64 Assembly Language Programming with Ubuntu"

section .data

    ; Standart constants:

    LF equ 10                     ; line feed
    NULL equ 0                    ; end of string
    TRUE equ 1
    FALSE equ 0
    EXIT_SUCCESS equ 0            ; success code
    STDIN equ 0                   ; standard input
    STDOUT equ 1                  ; standard output
    STDERR equ 2                  ; standard error
    SYS_read equ 0                ; read
    SYS_write equ 1               ; write
    SYS_open equ 2                ; file open
    SYS_close equ 3               ; file close
    SYS_fork equ 57               ; fork
    SYS_exit equ 60               ; terminate
    SYS_creat equ 85              ; file open/create
    SYS_time equ 201              ; get time
    O_CREAT equ 0x40
    O_TRUNC equ 0x200
    O_APPEND equ 0x400
    O_RDONLY equ 000000q          ; read only
    O_WRONLY equ 000001q          ; write only
    O_RDWR equ 000002q            ; read and write
    S_IRUSR equ 00400q
    S_IWUSR equ 00200q
    S_IXUSR equ 00100q


    ; Variables used in main:

    newLine db LF, NULL
    header db LF, "File Write Example."
    db LF, LF, NULL
    fileName db "textFile.txt", NULL
    message db "file message"
    db LF, NULL
    len dq $-message-1
    writeDone db "Write Completed.", LF, NULL
    fileDesc dq 0
    errMsgOpen db "Error opening file.", LF, NULL
    errMsgWrite db "Error writing to file.", LF, NULL

section .text
    global _start
_start:

    

    mov rdi, header
    call printString              ; Display header line...
 
openInputFile:
    mov rax, SYS_creat            ; file open/create
    mov rdi, fileName             ; file name string
    mov rsi, S_IRUSR | S_IWUSR    ; allow read/write
    syscall                       ; call the kernel
    cmp rax, 0                    ; check for success
    jl errorOnOpen
    mov qword [fileDesc], rax     ; save descriptor

    mov rax, SYS_write
    mov rdi, qword [fileDesc]
    mov rsi, message
    mov rdx, qword [len]
    syscall
    cmp rax, 0
    jl errorOnWrite
    mov rdi, writeDone
    call printString

    
    mov rax, SYS_close             

    mov rdi, qword [fileDesc]
    syscall                       ; Close the file.
    jmp exampleDone
  
errorOnOpen:
    mov rdi, errMsgOpen
    call printString
    jmp exampleDone

errorOnWrite:
    mov rdi, errMsgWrite
    call printString
    jmp exampleDone

exampleDone:
    mov rax, SYS_exit
    mov rdi, EXIT_SUCCESS
    syscall



    global printString
printString:
    push rbp
    mov rbp, rsp
    push rbx
    mov rbx, rdi
    mov rdx, 0
strCountLoop:
    cmp byte [rbx], NULL
    je strCountDone
    inc rdx
    inc rbx
    jmp strCountLoop
strCountDone:
    cmp rdx, 0
    je prtDone

    mov rax, SYS_write            ; code for write()
    mov rsi, rdi                  ; addr of characters
    mov rdi, STDOUT               ; file descriptor
    syscall 
    ; String printed, return to calling routine.
prtDone:
    pop rbx
    pop rbp
    ret
