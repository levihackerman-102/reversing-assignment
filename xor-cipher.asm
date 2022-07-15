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

SECTION .bss
    input_bytes: resb 255
    key_value: resb 255
    output: resb 255

SECTION .data
    inputMsg db 'Enter the text to be encrypted : '  ;string to be printed
    inputMsgLen equ $ - inputMsg     ;length of the string
    
    keyInputMsg db 'Enter the key : '  ;string to be printed
    keyInputMsgLen equ $ - keyInputMsg     ;length of the string

    newline db '',0xa ;insert new line
    newlineLen equ $ - newline ;length of newline

SECTION .text
    global _start


_start:     ;tells linker entry point
    call input  ;get user input
    call singlechar_xor ;xor input with key

input:
    mov edx, inputMsgLen
    mov ecx, inputMsg
    mov ebx, 1
    mov eax, 4
    int 0x80

    inputString input_bytes, 255

    mov edx, newline
    mov ecx, newlineLen
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov edx, keyInputMsg
    mov ecx, keyInputMsgLen
    mov ebx, 1
    mov eax, 4
    int 0x80

    inputString key_value, 255

    mov edx, newline
    mov ecx, newlineLen
    mov ebx, 1
    mov eax, 4
    int 0x80

    call singlechar_xor
	outputString output, 255

    mov edx, newline
    mov ecx, newlineLen
    mov ebx, 1
    mov eax, 4
    int 0x80

    ;quit
    xor ebx, ebx
	mov eax, 1
	int 0x80
	ret

singlechar_xor:
    push edx
	push ecx
	push ebx
	push eax

	mov eax, 100          ; eax contains the number of bytes left to process; max bytes processed will be 100
	mov ebx, input_bytes  ; ebx contains input_bytes pointer
	mov ecx, output       ; ecx contains output pointer

loopStart:
	cmp byte [ebx], 0x00  ; compare the value at input_bytes pointer with null byte
	jz loopEnd            ; break if equal

	cmp byte [ebx], 0x0A  ; compare the value at output pointer with '\n'
	jz loopEnd            ; break if equal

	cmp eax, 0            ; compare the value of number of bytes left to process with 0
	jz loopEnd            ; break if equal

	mov edx, [ebx]        ; store the (ascii) value at input_bytes pointer into edx
	xor edx, [key_value]  ; xor it with the (ascii) value at key_value pointer
	mov [ecx], edx        ; store the result in address pointed by output pointer

	dec eax               ; decrement the number of bytes left to process
	inc ebx               ; increase the input_bytes pointer
	inc ecx               ; increase the output pointer

	jmp loopStart

loopEnd:
	pop eax
	pop ebx
	pop ecx
	pop edx
	ret
