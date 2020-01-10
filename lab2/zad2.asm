section .data
	n	dq	7

section .bss
	result	resq	1

section .text
	global	_start

_start:
	mov rcx, qword[n]
	mov rdx, 1

_sumUp:
	add rax, rdx
	inc rdx
	loop _sumUp

_multiply:
	mul rax
	mov qword[result], rax
	mov qword[result+8], rdx

_end:
    mov rax, 60
    mov rdi, 0
    syscall

