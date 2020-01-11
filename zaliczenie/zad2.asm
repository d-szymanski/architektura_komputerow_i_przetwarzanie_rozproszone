section .data
	fileName	db	"plik.txt"
	len		dq	18

section .bss
	message	resb	18
	fd	resb	1

section .text
	global _start

_start: 

_open:
	mov rax, 2
	mov rdi, fileName
	mov rsi, 0
	mov rdx, 0644o
	syscall
	mov [fd], rax

_read:
	mov rax, 0
   	mov rdi, [fd]
	mov rsi, message
   	mov rdx, len
	syscall

_close:
	mov rax, 3
	mov rdi, [fd]
	syscall

_print:
	mov rax, 1
	mov rdi, 1
    	mov rsi, message
    	mov rdx, len
	syscall

_end:
        mov rax, 60
        mov rdi, 0
        syscall

