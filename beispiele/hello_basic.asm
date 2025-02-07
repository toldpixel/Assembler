section     .text
global      _start                              ;must be declared for linker (ld)

_start:                                         ;tell linker entry point

    mov eax, [a]
    cmp eax, 5
    je et
    mov ebx, [a]
    xor eax, eax
et:
    mov ebx, eax
   add eax, 10 
    add ebx, 2
    sub eax,ebx

;    mov     eax, 0 ; Summe befindet sich hier
;    mov     ecx, [a] 
;    mov     ebx, [b]
;et:
;    add     eax, ecx
;    dec     ebx
;    cmp     ebx, 0
;    jne     et
;    add     eax, [c] ; im eax=a+b+c

;ASCII Kodierung
    add     eax, 0x30   ;0- 0x30, 9- 0x39
    mov     [summe], eax
;wie viele Ziffern
;Kodierung 567 '567' 567 -> 0x353637
; push ebx
; pop ebx
; 10

;    cmp 
;    jmp
;    jne
;    je

    mov     edx,1                             ;message length
    mov     ecx,summe                             ;message to write
    mov     ebx,1                               ;file descriptor (stdout)
    mov     eax,4                               ;system call number (sys_write)
    int     0x80                                ;call kernel

    mov     eax,1                               ;system call number (sys_exit)
    int     0x80                                ;call kernel

section     .data

a   db 1 
b   db 4
c   db 3
summe db '0000000000'
;msg     db  'Hello, world!',0xa                 ;our dear string
;len     equ $ - msg                             ;length of our dear string


