global _start

section .text

_start:

; multiplication

mov rax,zahl
shl  rax, 4
mov rbx, rax
mov [zahl], rbx
;
mov rax, 0x4
mov rbx, 0x1
mov rcx, zahl
mov rdx, 1
int 0x80

; exit the program
mov rax, 0x1
mov rbx, 0x5
int 0x80

section .data
zahl db 7
