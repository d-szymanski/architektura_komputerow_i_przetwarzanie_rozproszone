; Napisz program, który
; zsumuje elementy zdefiniowanej niżej tablicy mieszczące się w przedziale <4; 9>.
section .data
	tab1 	dq		8, 4, 3, 10, 9, 1, 6, 11, 2, 7

; Wynik zapisz w zmiennej z sekcji .bss
section .bss
	wynik	resq	8

section .text
	global _start

_start:
	mov ecx, 8
	mov rsi, 0
  mov qword[wynik], 0

_compareToFour:
	mov rax, qword[tab1 + rsi * 8]
	cmp rdx, 4
	jb _continue

_compareToNine:
	cmp rdx, 9
	ja _continue
_addToSum:
  add qword[wynik], rax
_continue:
	inc rsi
	loop _compareToFour

_end:
  mov rax, 60
  mov rdi, 0
  syscall
