#!/bin/bash

nasm -f elf64 xor1.asm # assemble the program  
ld -s -o xor1 xor1.o # link the object file nasm produced into an executable file  
./xor1 # xor1 is an executable file
