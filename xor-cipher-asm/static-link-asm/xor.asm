%include 'utils.asm'

SECTION .text
global singlechar_xor

; conforms to 32 bit x86 C calling convention
singlechar_xor:
	push ebp          ; setup base pointer 
	mov ebp, esp

	sub esp, 4        ; make room for one local variable

	push ebx          ; save the callee-saved registers
	push edi
	push esi

	mov eax, [ebp+8]  ; input_bytes
	mov [ebp-4], eax  ; input_bytes pointer
	mov esi, [ebp+12] ; key_val (direct ascii value)
	mov edi, [ebp+16] ; output_bytes pointer

	call strlen       ; calculate the length of input_bytes; eax now contains length of input_bytes

loopStart:
	cmp eax, 0
	jz loopEnd

	mov ebx, [ebp-4]  ; load the char ascii value from input_bytes pointer
	mov ebx, [ebx]
	xor ebx, esi      ; perform xor with key_value
	mov [edi], ebx    ; save the resulting char to address pointed by output_bytes pointer

	dec eax           ; decrement the number of bytes left to process
	inc edi           ; increment the output_bytes pointer
	
	mov ebx, [ebp-4]  ; increment the input_bytes pointer
	inc ebx
	mov [ebp-4], ebx

	jmp loopStart

loopEnd:
	pop esi
	pop edi
	pop ebx
	mov esp, ebp
	pop ebp
	ret
