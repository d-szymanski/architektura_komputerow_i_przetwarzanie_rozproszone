; Zadanie 1
; Napisz program, którego wynikiem będą poniższe operacje arytmetyczne:
; Operuj na liczbach bez znaku. Do każdej zmiennej odpowiednio dobierz jej typ.

; Przyjmij poniższe dane:
; Num1 = 4212
; Num2 = 1275
; Num3 = 987
; Num4 = 125
section .data
  Num1  dq  4212
  Num2  dq  1275
  Num3  dq  987
  Num4  dq  125

section .bss
  Ans1  reso 1
  Ans2  reso 1
  Ans3  reso 1
  Ans6  reso 1
  Ans7  reso 1
  Ans8  reso 1
  Ans11 reso 1
  Ans12 reso 1
  Ans13 reso 1
  Ans16 reso 1
  Ans17 reso 1
  Ans18 reso 1
 
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

; Ans6 = Num1 – Num2
  mov rax, qword [Num1]
  sub rax, qword [Num2]
  mov qword [Ans6], rax

; Ans7 = Num1 – Num3
  mov rax, qword [Num1]
  sub rax, qword [Num3]
  mov qword [Ans7], rax

; Ans8 = Num2 – Num4
  mov rax, qword [Num2]
  sub rax, qword [Num4]
  mov qword [Ans8], rax

; Ans11 = Num1 * Num3
  mov rax, qword [Num1]
  mul qword [Num3]
  mov qword [Ans11], rax
  mov qword [Ans11+8], rdx

; Ans12 = Num2 * Num2
  mov rax, qword [Num2]
  mul qword [Num2]
  mov qword [Ans12], rax
  mov qword [Ans11+8], rdx

; Ans13 = Num2 * Num4
  mov rax, qword [Num2]
  mul qword [Num4]
  mov qword [Ans13], rax
  mov qword [Ans13+8], rdx

; Ans16 = Num1 / Num2
  mov rdx, 0            ; clear
  mov rax, qword [Num1] ; divident
  div qword [Num2]
  mov qword [Ans16], rax ; main in rax, rest in rdx

; Ans17 = Num3 / Num4
  mov rdx, 0
  mov rax, qword [Num3]
  div qword [Num4]
  mov qword [Ans17], rax

; Ans18 = Num1 / Num4
  mov rdx, 0
  mov rax, qword [Num1]
  div qword [Num4]
  mov qword [Ans18], rax
  
  ret ; return from call
