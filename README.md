# Architektura komputerów i przetwarzanie rozproszone

Instructions: https://mgruszczynski.pl/cdv/asm/

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

`gdb arithmetic` - start gdb on arithmetic program
`b _end` - set breakpoint on \_end label
`run` - run our program
`print ${variable}` - print variable
`info registers` - log registers values
`si` - step in - next instructions
`c` - continue to next breakpoint or end of a program
