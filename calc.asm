global _start

section .text

_start:


mov eax,[zahlen]


Print:
mov ebx, 0x00

pop ebx
add [zahlen+ebx], 0x30

inc ebx     ; ebx für den nächsten schleifen durchlauf retten
push ebx    ; ebx auf den stack sichern

mov eax, 0x4
mov ebx, 0x1
mov ecx, zahlen
mov edx, 8
int 0x80

loop Print

;exit funktion
mov eax, 0x1
mov ebx, 0x5
int 0x80

section .data

zahlen:	db 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8
