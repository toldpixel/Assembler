;Wenn das 4. Bit den Wert 1 hat, dann rechne x+2, wenn nicht dann rechne x+3

global _start

section .text

_start:
  mov rax, 00001110b
  mov rbx, 10000000b
  and rax, rbx
  cmp rax, rbx
  jne nichtgleich

gleich:       ;equal calculate x+2
mov rax, [x]
add rax, 2
mov [x], rax
jmp printout

nichtgleich:  ; not equal calculate x+3
mov rax, [x]
add rax, 3
mov [x],rax

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

var: db 0
x: db 1

section .bss ;uninitialisierter Datenbereich
