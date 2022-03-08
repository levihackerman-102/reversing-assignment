section .data
    getplaintext db "Enter the text to be encrypted"  ; max input length: 100
    len1 equ $ - getplaintext
    getkey db "Enter the xor key"                     ; single char only
    len2 equ $ - getkey

section .bss
    plaintext resb 100 ; reserve 100 bytes for plaintext to be encrypted
    key resb 1         ; reserve 1 byte for xor key

section .text
    global _start

_start: 
    call _printText1
    call _input1
    call _printText2
    call _input2

    mov esi, key
    mov edi, plaintext
    mov ecx, len1

    xorloop:
        lodsb
        xor al, [key]
        stosb
        loop xorloop
        
    mov rax, 60
    mov rdi, 0
    syscall

_printText1:
    mov rax, 1
    mov rdi, 1
    mov rsi, getplaintext
    mov rdx, len1
    syscall
    ret

_input1:
    mov rax, 0
    mov rdi, 0
    mov rsi, plaintext
    mov rdx, 100
    syscall
    ret

_printText2:
    mov rax, 1
    mov rdi, 1
    mov rsi, getkey
    mov rdx, len2
    syscall
    ret

_input2:
    mov rax, 0
    mov rdi, 0
    mov rsi, key
    mov rdx, 1
    syscall
    ret
