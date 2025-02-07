global _start

section .text

_start:

xor rax, rax



section .data

var: db 0x55
var1: db 0x55, 0x56, 0x57
;db 'a', 0x55
;db 'hello', 13, 10,'$'
;db 0x1234
