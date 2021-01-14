section .data
	Num1	dq	4
	Num2	dq	8
	Num3	dq	6

section .bss
  result reso 1

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