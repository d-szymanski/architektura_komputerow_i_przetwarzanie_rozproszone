; ----------------------------------------------------------------------------------------
; Writes sum of odd numbers from 0 to 15 to the console using only system calls. Runs on 64-bit Linux only. (for mac there is $0x2000000 offset for every system call)
; To assemble and run:
;
;     nasm -felf64 sum.asm && ld -o sum.out sum.o && ./sum.out
; ----------------------------------------------------------------------------------------


section .data
    lpCount dq  15
    sum dq  0

section .text
    global _start

_start:
    mov rcx, qword [lpCount]
    mov rax, 1
    call _odd_sum_loop

_end: 
  mov rax, 60
  mov rdi, 0
  syscall

_odd_sum_loop:
    add qword[sum], rax
    add rax, 2 ; move to next odd number
    dec rcx
    cmp rcx, 0
    jne _odd_sum_loop
    ret ; return to call
