; Napisz program, który w sekcji .data będzie miał zadeklarowane dwie zmienne a oraz b (przyprostokątne trójkąta).
; Oblicz kwadrat przeciwprostokątnej.
; Wynik przechowaj w zmiennej pamięci, zadeklarowanej w sekcji .bss

section .data
  a  dq  3
  b  dq  4

section .bss
  a2  reso 1;
  c2  reso 1; c^2 = a^2 + b^2

section .text
  global _start

_start:
  call _triangle

_end:
  mov rax, 60
  mov rdi, 0
  syscall

_triangle
  mov rax, qword [a]
  mul qword [a]
  mov qword [a2], rax
  mov qword [a2+8], rdx

  mov rax, qword [b]
  mul qword [b]

  add rax, qword [a2]
  mov qword [c2], rax

  ret