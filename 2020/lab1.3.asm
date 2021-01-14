; Napisz program, który obliczy średnią (bez reszty) 4 ocen.
; Wartości ocen zadeklaruj w sekcji .data.
; Wynik przechowuj w pamięci z sekcji .bss.

section .data
  Num1  dq  4
  Num2  dq  5
  Num3  dq  7
  Num4  dq  8

section .bss
  Ans reso  1

section .text
  global _start

_start:
  call _calc

_end:
  mov rax, 60
  mov rdi, 0
  syscall

_calc:
  mov rax, qword [Num1]
  add rax, qword [Num2]
  add rax, qword [Num3]
  add rax, qword [Num4]
  mov rdx, 0
  mov rcx, 4
  div rcx
  mov qword[Ans], rax
  ret
