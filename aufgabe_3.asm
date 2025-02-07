;rechne (x-2) + y

global _start

section .text

_start:

  xor rax, rax
  mov al, [x]
  mov bl, [y]
  sub al, 2
  add al,bl
  mov [x], al
  ;print on screen
  add byte [x],0x30
  mov rax, 1 ;write syscall
  mov rdi, 1 ;stdout
  mov rsi, x ;adress of buffer
  mov rdx, 1 ;size of buffer
  syscall

  ;exit the program
  mov al, 60
  mov rdi, 0
  syscall

section .data ;initialisierter Datenbereich

x: db 5
y: db 3

section .bss ;uninitialisierter Datenbereich
