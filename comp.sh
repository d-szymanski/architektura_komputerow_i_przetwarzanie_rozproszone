#!/bin/bash

# use: ./comp.sh file-name-without-extantion
nasm -felf64 $1.asm && ld -o $1.out $1.o && gdb $1.out

