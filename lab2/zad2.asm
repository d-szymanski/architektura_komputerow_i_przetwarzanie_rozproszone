section .data
	n	dq	5
	result	dq	0

section .text
	global _start

_start:
	mov rax, 0
	mov rcx, qword [n]
_loopSum:
	add rax, rcx
	dec rcx
	cmp rcx, 0
	jne _loopSum
_squareSum:
	mul rax
	mov qword [result], rax

_end:
	mov rax, 60
	mov rdi, 0
	syscall