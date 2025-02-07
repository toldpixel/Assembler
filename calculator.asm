extern read
extern printf

global _start

section .text

_start:

  mov rax, 4 ; number 1
  mov rbx, 2 ; number 2
  mov dh,"/" ; operation

addition:
  mov dl,"+"
  cmp dh, dl
  jne subtraction
  add rax, rbx
  mov [result],rax
  jmp print

subtraction:
  mov dl, "-"
  cmp dh, dl
  jne multiplicate
  sub rax, rbx
  mov [result], rax
  jmp print

multiplicate:
  mov dl, "*"
  cmp dh, dl
  jne divide
  mul bl
  mov [result], rax
  jmp print

divide: ;fix floating-point exception
  mov dl, "/"
  cmp dh, dl
  jne div_fail
  cmp rbx, 0
  je div_fail
  xor rdx, rdx ;needs to be cleared before using div
  div rbx
  mov [result], rax
  jmp print

div_fail:
  mov rax, 0
  mov [result],rax
  jmp print

  ;print on screen
  print:
  mov rax, 1
  mov rdi, 1
  mov rsi, output_hello
  mov rdx, length
  syscall

  add byte [result], 0x30
  mov rax, 1
  mov rdi, 1
  mov rsi, result
  mov rdx, 1
  syscall

  exit:

  mov rax, 60
  mov rdi, 11
  syscall

section .data

output_hello: db "Ergebnis:",0xa
length: equ $-output_hello
result: db 0
