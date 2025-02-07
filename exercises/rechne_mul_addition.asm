global _start



section .text

_start:

  xor al, al
  mov al, 9
  add al, 0x30
  mov [var1],al

  ;print on screen
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

var1: db 0x00

section .bss ;uninitialisierter Datenbereich
