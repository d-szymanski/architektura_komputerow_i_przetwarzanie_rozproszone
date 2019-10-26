; ----------------------------------------------------------------------------------------
;  Writes summ of odd numbers from 0 - 30 to the console using only system calls.
;  Runs on 64-bit Linux only. (for mac there is $0x2000000 offset for every system call)
; To assemble and run:
;
;     nasm -felf64 odd_sum.asm && ld -o odd_sum.out odd_sum.o && gdb odd_sum.out
; ----------------------------------------------------------------------------------------

section .data
    lpCount dd 30
    sum dq 0
    temp dq 1

section .text
    global _start

_start:
    mov ecx, dword [lpCount]
    mov rbx, 2
    call _sum_loop

_end: 
  mov rax, 60
  mov rdi, 0
  syscall

_sum_loop:
    mov rax, qword [temp]
    mov rdx, 0
    div rbx
    cmp rdx, 1
    jne _next ;jump if not qual (avoid incrementation)
    mov rax, qword [temp] 
    add qword [sum], rax ; increment

_next:
    inc qword [temp] ; increment temp 
    loop _sum_loop
    ret
