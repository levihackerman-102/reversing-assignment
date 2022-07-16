#!/bin/bash

nasm -f elf xor-cipher.asm # assemble the program  
ld -m elf_i386 -s -o xor-cipher xor-cipher.o # link the object file nasm produced into an executable file  
./xor-cipher # xor-cipher is an executable file

# rm -rf xor-cipher.o xor-cipher
