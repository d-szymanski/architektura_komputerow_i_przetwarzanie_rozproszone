; Zadanie 1
; Napisz program, którego wynikiem będą poniższe operacje arytmetyczne:
; Operuj na liczbach bez znaku. Do każdej zmiennej odpowiednio dobierz jej typ.

; Przyjmij poniższe dane:
section .data
  Num1  dq  4212
  Num2  dq  1275
  Num3  dq  987
  Num4  dq  125

section .bss
  Ans1  reso 1
  Ans2  reso 1
  Ans3  reso 1
  Ans4  reso 1
  Ans5  reso 1
  Ans6  reso 1
  Ans7  reso 1
  Ans8  reso 1
  Ans9  reso 1
  Ans10  reso 1
  Ans11 reso 1
  Ans12 reso 1

section .text
  global _start

_start:
  call _calc

_end:
  mov rax, 60
  mov rdi, 0
  syscall

_calc:
; Ans1 = Num1 + Num2
  mov rax, qword [Num1]
  add rax, qword [Num2]
  mov qword [Ans1], rax

; Ans2 = Num1 + Num3
  mov rax, qword [Num1]
  add rax, qword [Num3]
  mov qword [Ans2], rax

; Ans3 = Num3 + Num4
  mov rax, qword [Num3]
  add rax, qword [Num4]
  mov qword [Ans3], rax

; Ans4 = Num1 – Num2
  mov rax, qword [Num1]
  sub rax, qword [Num2]
  mov qword [Ans4], rax

; Ans5 = Num1 – Num3
  mov rax, qword [Num1]
  sub rax, qword [Num3]
  mov qword [Ans5], rax

; Ans6 = Num2 – Num4
  mov rax, qword [Num2]
  sub rax, qword [Num4]
  mov qword [Ans6], rax

; Ans7 = Num1 * Num3
  mov rax, qword [Num1]
  mul qword [Num3]
  mov qword [Ans7], rax
  mov qword [Ans7+8], rdx

; Ans8 = Num2 * Num2
  mov rax, qword [Num2]
  mul qword [Num2]
  mov qword [Ans8], rax
  mov qword [Ans8+8], rdx

; Ans9 = Num2 * Num4
  mov rax, qword [Num2]
  mul qword [Num4]
  mov qword [Ans9], rax
  mov qword [Ans9+8], rdx

; Ans10 = Num1 / Num2
  mov rdx, 0
  mov rax, qword [Num1]
  div qword [Num2]
  mov qword [Ans10], rax

; Ans11 = Num3 / Num4
  mov rdx, 0
  mov rax, qword [Num3]
  div qword [Num4]
  mov qword [Ans11], rax

; Ans12 = Num1 / Num4
  mov rdx, 0
  mov rax, qword [Num1]
  div qword [Num4]
  mov qword [Ans12], rax

  ret ; return from call
