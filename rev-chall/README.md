The disassembly in gdb with comments after testing:
```asm
   0x00005555554006ca <+0>:     push   rbp	
   0x00005555554006cb <+1>:     mov    rbp,rsp
   0x00005555554006ce <+4>:     sub    rsp,0x10
   0x00005555554006d2 <+8>:     mov    DWORD PTR [rbp-0x4],edi
   0x00005555554006d5 <+11>:    mov    QWORD PTR [rbp-0x10],rsi
   0x00005555554006d9 <+15>:    cmp    DWORD PTR [rbp-0x4],0x1	// check if key is provided
   0x00005555554006dd <+19>:    jg     0x5555554006f5 <main+43> // jump to main+43 if key is provided
   0x00005555554006df <+21>:    lea    rdi,[rip+0x162]        # 0x555555400848
   0x00005555554006e6 <+28>:    call   0x555555400580 <puts@plt> // usage: ./glowwine <key>
   0x00005555554006eb <+33>:    mov    eax,0x0
   0x00005555554006f0 <+38>:    jmp    0x55555540079d <main+211>
   0x00005555554006f5 <+43>:    mov    rax,QWORD PTR [rbp-0x10]
   0x00005555554006f9 <+47>:    add    rax,0x8
   0x00005555554006fd <+51>:    mov    rax,QWORD PTR [rax]
   0x0000555555400700 <+54>:    mov    rdi,rax
   0x0000555555400703 <+57>:    call   0x555555400590 <strlen@plt> // returns length of key provided 
   0x0000555555400708 <+62>:    cmp    rax,0x5 // checks if length is 5
   0x000055555540070c <+66>:    je     0x555555400718 <main+78> // jump to main+78 if length is 5
   0x000055555540070e <+68>:    mov    eax,0x0
   0x0000555555400713 <+73>:    call   0x55555540079f <sorrybro> // wrong key, try again :/
   0x0000555555400718 <+78>:    mov    rax,QWORD PTR [rbp-0x10]
   0x000055555540071c <+82>:    add    rax,0x8
   0x0000555555400720 <+86>:    mov    rax,QWORD PTR [rax]
   0x0000555555400723 <+89>:    add    rax,0x1
   0x0000555555400727 <+93>:    movzx  eax,BYTE PTR [rax]
   0x000055555540072a <+96>:    cmp    al,0x40 // check if key[1] == '@'
   0x000055555540072c <+98>:    je     0x555555400738 <main+110>
   0x000055555540072e <+100>:   mov    eax,0x0
   0x0000555555400733 <+105>:   call   0x55555540079f <sorrybro> // wrong key, try again :/
   0x0000555555400738 <+110>:   mov    rax,QWORD PTR [rbp-0x10]
   0x000055555540073c <+114>:   add    rax,0x8
   0x0000555555400740 <+118>:   mov    rax,QWORD PTR [rax]
   0x0000555555400743 <+121>:   add    rax,0x2  // move to key[2]
   0x0000555555400747 <+125>:   movzx  eax,BYTE PTR [rax] // move ascii value of key[2] to eax
   0x000055555540074a <+128>:   movsx  edx,al 
   0x000055555540074d <+131>:   mov    rax,QWORD PTR [rbp-0x10]
   0x0000555555400751 <+135>:   add    rax,0x8
   0x0000555555400755 <+139>:   mov    rax,QWORD PTR [rax]
   0x0000555555400758 <+142>:   add    rax,0x3 // move to key[3]
   0x000055555540075c <+146>:   movzx  eax,BYTE PTR [rax]
   0x000055555540075f <+149>:   movsx  eax,al
   0x0000555555400762 <+152>:   add    edx,eax // add ascii value of key[3] to edx
   0x0000555555400764 <+154>:   mov    rax,QWORD PTR [rbp-0x10]
   0x0000555555400768 <+158>:   add    rax,0x8
   0x000055555540076c <+162>:   mov    rax,QWORD PTR [rax]
   0x000055555540076f <+165>:   add    rax,0x4 // move to key[4]
   0x0000555555400773 <+169>:   movzx  eax,BYTE PTR [rax]
   0x0000555555400776 <+172>:   movsx  eax,al
   0x0000555555400779 <+175>:   add    eax,edx // add ascii value of key[4] to edx
   0x000055555540077b <+177>:   cmp    eax,0x12c // check if [edx] == 0x12c
   0x0000555555400780 <+182>:   je     0x55555540078c <main+194>
   0x0000555555400782 <+184>:   mov    eax,0x0
   0x0000555555400787 <+189>:   call   0x55555540079f <sorrybro> // wrong key, try again :/
   0x000055555540078c <+194>:   lea    rdi,[rip+0xcd]        # 0x555555400860
   0x0000555555400793 <+201>:   call   0x555555400580 <puts@plt> // nice one! Now, can you keygen me?
   0x0000555555400798 <+206>:   mov    eax,0x0
   0x000055555540079d <+211>:   leave
   0x000055555540079e <+212>:   ret
```

One possible key satisfying this would be ```a@ddd```.
