section .data
	arr1	dq	1, 2, 3, 4, 5
	arr2	dq	5, 6, 7, 8, 9

section .bss
	arr3	resq	5
	result	resq	1

section .text
	global _start

_start:
	mov ecx, 5
	mov rbx, 0

_sumTwoValues:
	mov rax, qword[arr1 + rbx * 8]
	add rax, qword[arr2 + rbx * 8]
	mov qword[arr3 + rbx * 8], rax
	push rax
	inc rbx
	loop _sumTwoValues

_beforeSumAll:
	mov ecx, 5
	mov rbx, 0
	mov rax, 0

_sumAll:
	pop rsi
	add rax, rsi
	inc rbx
	loop _sumAll

_writeResult
	mov qword[result], rax

_end:
	mov rax, 60
	mov rdi, 0
	syscall
