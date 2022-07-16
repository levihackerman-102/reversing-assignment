ASM = xor
C = main

all:
	nasm -f elf $(ASM).asm
	gcc -m32 -shared $(ASM).o -o bin/lib$(ASM).so

	gcc -m32 -c $(C).c -o $(C).o

	gcc -m32 $(C).o -Lbin -l$(ASM) -o $(C) 

	rm -f *.o

clean:
	rm -f bin/lib$(ASM).so
	rm -f $(C)
