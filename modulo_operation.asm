
global _start



section .text

_start:
  mov dword [var1], 12 ;dword to var1
  mov rdx, 0           ; clear rdx
  mov rax, [var1]      ; 12 to rax
  mov rbx, 10          ;
  div rbx              ; div rax by 10
  mov [var1],rdx       ; ratio in rdx 
  ;print on screen
  add dword [var1],0x30
  mov rax, 1 ;write syscall
  mov rdi, 1 ;stdout
  mov rsi, var1 ;adress of buffer
  mov rdx, 1 ;size of buffer
  syscall
  ;exit the program
  mov al, 60
  mov rdi, 0
  syscall

section .data ;initialisierter Datenbereich

var1: dw  0x0000

section .bss ;uninitialisierter Datenbereich
