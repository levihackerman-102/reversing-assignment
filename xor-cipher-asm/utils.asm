;reads string from input into a string starting at first arg with length second arg
%macro inputString 2
	push edx
	push ecx
	push ebx
	push eax

	mov edx, %2 ; number of characters to read
	mov ecx, %1 ; starting address of string where the input will be stored
	mov ebx, 0  ; read from STDIN
	mov eax, 3  ; read syscall opcode
	int 0x80

	pop eax
	pop ebx
	pop ecx
	pop edx
%endmacro


;prints to stdout string starting at first arg with length second arg
%macro outputString 2
	push edx
	push ecx
	push ebx
	push eax

	mov edx, %2 ; number of characters to write
	mov ecx, %1 ; starting address of string which will be printed
	mov ebx, 1  ;	write to STDOUT
	mov eax, 4  ; write syscall opcode
	int 0x80

	pop eax
	pop ebx
	pop ecx
	pop edx
%endmacro
