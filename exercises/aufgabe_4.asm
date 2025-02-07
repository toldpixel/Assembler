;Wenn x = 5, dann (x+10)-(x+2), wenn nicht - x + (x+1)

global _start

section .text

_start:

  mov rax, [x]
  mov rbx, [y]
  cmp rax, rbx
  jne nichtgleich

gleich:
mov rbx, [x]
add rbx, 2
add rax, 10
sub rax, rbx
jmp printout

nichtgleich:
add rax, 1
add rax, [x]
mov [x], rax

printout:
  ;print on screen
  add dword [x],0x30
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

y: db 5
x: db 1

section .bss ;uninitialisierter Datenbereich
