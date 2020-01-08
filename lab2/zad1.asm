section .data
	Num1	dq	2
	Num2	dq	8
	Num3	dq	5
	result	dq	0

section .text
	global _start

;Always store highest in rax
_start:
	mov rax, qword [Num1]
	mov rbx, qword [Num2]
	call _compare
	mov rbx, qword [Num3]
	call _compare
	jmp _saveHighest

_compare:
	cmp rax, rbx
	ja _endCompare
	mov rax, rbx
_endCompare:
	ret

_saveHighest:
	mov qword [result], rax
_end:
	mov rax, 60
	mov rdi, 0
	syscall