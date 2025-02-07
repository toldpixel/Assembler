extern printf
extern scanf

global main

section .text

main:

   ; printf implementation


;scanf implementation
  xor rax, rax
  mov rdi, inputformat
  mov rsi, buffer 
  call scanf
   
   mov rax, 4 ; number 1
   mov rbx, 2 ; number 2
   mov dh,"+" ; operation

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

;print in screen
print: ; printf implementation
mov rdi, outputformat ;format output
mov rsi, [result]     ; first parameter %d
mov rax,0             ; no xmm
call printf WRT ..plt ;Call C function

;exit function
mov	rax,60
syscall

section .data

result: dq 0
outputformat: db "Result: %ld", 10, 0 ;"\n","0"
inputformat: db "%s",0
msg1: db "Enter a equation: ", 10, 0

section .bss

buffer: resb 50
