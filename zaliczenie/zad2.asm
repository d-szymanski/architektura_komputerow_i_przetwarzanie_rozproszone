section .data
	fileName	db	"plik.txt"

section .bss
	message	resb	255

section .text
	global _start

_start: 



_read:
	mov rax, 0
   	mov rdi, [fd_in]
	mov rsi, info
   	mov rdx, len
	syscall

_print:
	mov rax, 1
	mov rdi, 1
    	mov rsi, message
    	mov rdx, 12
	syscall
_end:
        mov rax, 60
        mov rdi, 0
        syscall

