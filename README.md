# Architektura komputerów i przetwarzanie rozproszone

Instructions: https://mgruszczynski.pl/cdv/asm/

Exercises:

- https://mgruszczynski.pl/cdv/asm/z1.html

- https://mgruszczynski.pl/cdv/asm/z2.html

## Compiling

Compile, link and run debugger!

```bash
nasm -felf64 a.asm
ld -o a.out a.o
gdb a.out
```

Or one liner:

```bash
nasm -felf64 a.asm && ld -o a.out a.o && gdb a.out
```

## Debugging

`gdb program.out` - start gdb on arithmetic program

`b _end` - set breakpoint on \_end label

`r` or `run` - run our program 

`p variable` or `print variable` - print variable

`i r` or `info registers` - log registers values

`si` - step in - next instructions

`c` - continue to next breakpoint or end of a program

`q` - end program

## Cheat Sheet

```
_end:
        mov rax, 60
        mov rdi, 0
        syscall
```

