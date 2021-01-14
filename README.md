# Architektura komputerów i przetwarzanie rozproszone

Instructions: https://mgruszczynski.pl/cdv/asm/

Exercises:

- https://mgruszczynski.pl/cdv/asm/z1.html

- https://mgruszczynski.pl/cdv/asm/z2.html

- https://mgruszczynski.pl/cdv/asm/excersises

## Compiling

Compile, link and run debugger!

```bash
nasm -felf64 fileName.asm
ld -o fileName.out fileName.o
gdb fileName.out
```

Or one liner:

```bash
File="lab3.2" && nasm -felf64 $File.asm && ld -o $File.out $File.o && gdb $File.out
```

Compiling C - one liner

```bash
File="lab3.2" && gcc -Wall $File.c -o $File.out && ./$File.out
```

## Debugging

`gdb program.out` - start gdb on arithmetic program

`b _end` - set breakpoint on \_end label

`r` or `run` - run our program

`p (type)variable` or `print (type)variable` - print variable

```
p (int)result
```

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

