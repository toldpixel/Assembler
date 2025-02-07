;nasm -f elf64 -o test.o test.s
;gcc -o test test.o -lc

;;;; Print a number to stdout


extern printf

global main

section .text
main:
    mov rdi,printf_format
    mov rsi,1230
    xor rax,rax
    call printf WRT ..plt


    mov rax,60  ; exit
    syscall


section .data
    printf_format: db '%d',10,0

