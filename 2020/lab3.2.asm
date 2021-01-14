
section .data
  msg: db 'Twoje imie: '
  msg_size: equ $-msg

  msg2: db 'To jest nowy plik tekstowy stworzony przez: '
  msg2_size: equ $-msg2

  fileName	db	"imie.out",0

section .bss
  inp_buf resb 256
  fd  resb 1


section .text
  global _start

_start:

_input:
  mov  rax, 1		;sys_wite
  mov  rdi, 1		;To stdout
  mov  rsi, msg		;'Input some data: '
  mov  rdx, msg_size
  syscall	;Call kernel

  mov  rax, 0		;sys_read. Read what user inputs
  mov  rdi, 0		;From stdin
  mov  rsi, inp_buf	;Save user input to buffer.
  syscall

  push rax

_create
  mov rax, 2
  mov rdi, fileName
  mov rsi, 65
  mov rdx, 0644o
  syscall
  mov [fd], rax

_output:
  mov  rax, 1
  mov  rdi, 1
  mov  rsi, msg2
  mov  rdx, msg2_size
  syscall

  mov  rax, 1
  mov  rdi, [fd]
  mov  rsi, msg2
  mov  rdx, msg2_size
  syscall

_output2:
  mov  rax, 1
  mov  rdi, 1
  mov  rsi, inp_buf
  pop  rdx
  syscall

  mov  rax, 1
  mov  rdi, [fd]
  mov  rsi, inp_buf
  syscall

	mov rax, 60
	mov rdi, 0
	syscall
