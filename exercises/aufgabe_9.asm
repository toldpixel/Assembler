;Rechne x*y mit Addition

global _start

section .text

_start:

  mov rcx, [x] ; prepare x and y
  mov rbx, [y]

  repeat: ; add y+y+y+y+y+..... * x
  add rax,rbx
  loop repeat

  mov [result],rax

  ;print on screen
  add byte [result],0x30
  mov rax, 1 ;write syscall
  mov rdi, 1 ;stdout
  mov rsi, result ;adress of buffer
  mov rdx, 1 ;size of buffer
  syscall

  ;exit the program
  mov al, 60
  mov rdi, 0
  syscall

section .data ;initialisierter Datenbereich

x: db 3
y: db 2
result: db 0

section .bss ;uninitialisierter Datenbereich
