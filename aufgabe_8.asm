;Rechne x = x -1, bis x = 0

global _start

section .text

_start:
  mov cx, [x]

  repeat: ; x = x - 1 through looping
  dec byte [x]
  loop repeat
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

section .bss ;uninitialisierter Datenbereich
