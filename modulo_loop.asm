global _start

section .text

_start:

mov dword [var1], 65 ;dword to var1 zahlen bis 2 bytes
mov rcx, 0x00
mov rax, [var1]      ; 12 to rax
mov rbx, 10          ;

ModulLoop:

  mov rdx, 0                 ; clear rdx
  div rbx                    ; div rax by 10
  mov [buffer+rcx],rdx       ; ratio in rdx
  inc rcx                    ; rcx to increase the buffer address
  cmp rax,rbx                ; compare if greater or equal  eax >= ebx
  jge ModulLoop              ;
  mov [buffer+rcx],rax       ; last number into buffer

PrintLoop:
  ;print on screen
  add byte [buffer+rcx],0x30 ; for ascii values 0-9 0x30 needs to be added
  mov rbx, 0x00              ; for compare operation with rcx >= 0
  mov rax, 1                 ;write syscall
  mov rdi, 1                 ;stdout
  lea rsi, [buffer+rcx]      ; load effective adress of buffer
  push rcx                   ;save current rcx before syscall
  mov rdx, 1                 ;size of buffer
  syscall
  pop rcx                    ;bringing back rcx
  dec rcx                    ;decrementing rcx for next use
  cmp rcx, rbx               ;rcx and rbx for >= operation
  jge PrintLoop

  ;exit the program
  mov al, 60
  mov rdi, 0
  syscall

section .data ;initialisierter datenbereich

var1: dw 0x0000

section .bss ;uninitialisierter datenbereich

buffer: resb 8  ;reserve 8 bytes
