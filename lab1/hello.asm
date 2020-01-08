; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit Linux only. (for mac there is $0x2000000 offset for every system call)
; To assemble and run:
;
;     nasm -felf64 hello.asm && ld -o hello.out hello.o && ./hello.out
; ----------------------------------------------------------------------------------------


section .data
    message db  "Hello world",0xa   ; db - declare byte (bajt) ex. dw - declare word, dq - declare quadword.
                                    ; 0xa - koniec lini (mozna `10`) - ASCII 10 - new line
section .bss

section .text
    global _start

_start:
    mov rax, 1      ; sys_write
    mov rdi, 1      ; file descriptor 1 - (stdout)
    mov rsi, message   ; address of string to output
    mov rdx, 12     ; number of bytes
    syscall         ; run

_end:               ; sys_exit
    mov rax, 60
    xor rdi, 0      ; exit code 0
    syscall         ; run
