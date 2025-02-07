nmglobal _start


section .text

_start:
  xor al, al
  mov al, [var1]
  add al, [var1 + 1]
  mov bl, al
  add bl, [var1 + 2]
  ;exit the program
  mov rax, 60
  mov rdi, 0
  syscall

section .data ;initialisierter Datenbereich

  var1: db 0x10, 0x20, 0x30

section .bss ;uninitialisierter Datenbereich
