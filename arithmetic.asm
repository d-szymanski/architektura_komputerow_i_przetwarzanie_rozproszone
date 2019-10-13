; ----------------------------------------------------------------------------------------
; Arithmetic operations in assembly 
; To assemble and run:
;
;     nasm -felf64 arithmetic.asm && ld -o arithmetic.out arithmetic.o && ./arithmetic.out
; ----------------------------------------------------------------------------------------

; Debugging:
; gdb arithmetic - start gdb on arithmetic program
; b _end - set breakpoint on _end label
; run - run our program
; info registers - log registers values
; si - step in - next instructions
; c - continue to next breakpoint or end of a program

section .data
  globalNumber1   dq 420
  globalNumber2   dq 730
  sumAnswer       dq 0
  mulAnswer       dq 0
 
section .text
  global _start

_start:
_sum:
  mov rax, qword [globalNumber1]
  add rax, qword [globalNumber2]
  mov qword [sumAnswer], rax 

_multiplier
  mov rax, qword [globalNumber1]
  mul qword [globalNumber2] ; wynik w rax i rdx
  mov qword [mulAnswer], rax
  mov qword [mulAnswer+8], rdx

_end: 
  mov rax, 60
  mov rdi, 0
  syscall
