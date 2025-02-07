;Stelle das 5. Bit auf Eins und die Bits 7 und 8 auf Null

global _start

section .text

_start:
  mov rax, 110000000b ;to set bits 7. 8. to zero we and rbx and rax
  mov rbx, 000000000b
  and rax, rbx
  mov  bl, 00000001b  ;shift 1 to i and or it   var | (1 << 5)
  shl  bl, 5
  or  rax, rbx
  mov [var], rax

  ;print on screen
  add byte [var], 0x30
  mov rax, 1 ;write syscall
  mov rdi, 1 ;stdout
  mov rsi, var ;adress of buffer
  mov rdx, 1 ;size of buffer
  syscall
  ;exit the program
  mov al, 60
  mov rdi, 0
  syscall

section .data ;initialisierter Datenbereich

var: db 0

section .bss ;uninitialisierter Datenbereich
