section .data
	tab1 	dq		15, 19, 24, 31, 55, 81, 101, 111
	
section .bss
	tablicaWynikowa	resq	8

section .text
	global _start

_start: 
	mov rbx, 3
	mov ecx, 8
	mov rsi, 0
	mov rdi, 0

_divideByThree:
	mov rax, qword[tab1 + rsi * 8]
	mov rdx, 0
	div rbx
	cmp rdx, 0
	jne _continue
_writeToTable:
	mov qword[tablicaWynikowa + rdi * 8], rax
	inc rdi
_continue:
	inc rsi
	loop _divideByThree

_end:
        mov rax, 60
        mov rdi, 0
        syscall

