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
  globalNumber1   dq 42000
  globalNumber2   dq 73000
  sumAnswer      dq 0

section .text
  global _start

_start:
  mov rax, qword [globalNumber1]
  add rax, qword [globalNumber2]
  mov qword [sumAnswer], rax 

_end: 
  mov rax, 60
  mov rdi, 0
  syscall
