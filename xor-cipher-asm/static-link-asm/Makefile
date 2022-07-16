asm = xor
C = main

build:
	nasm -f elf $(asm).asm
	ar rcs bin/lib$(asm).a $(asm).o

	gcc -m32 -c $(C).c -o $(C).o

	gcc -m32 $(C).o -Lbin -l$(asm) -o $(C)

	rm -f *.o

clean:
	rm -f bin/lib$(asm).a
	rm -f $(C)
