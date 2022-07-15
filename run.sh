#!/bin/bash

nasm -f elf64 xor-cipher.asm # assemble the program  
ld -s -o xor-cipher xor-cipher.o # link the object file nasm produced into an executable file  
./xor-cipher # xor-cipher is an executable file
