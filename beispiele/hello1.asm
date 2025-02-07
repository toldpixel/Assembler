section .data
  hello:     db 'Hello world!'    ; 'Hello world!' 
  helloLen:  equ $-hello             ; Lenge von hello

  mytext: times 20 db 0
  myvar:    db 0

section .text
  global _start

_start:
; system call functions https://syscalls.kernelgrok.com <--- WICHTIG!
;  mov eax,4            ; The system call for write (sys_write)
;  mov ebx,1            ; File descriptor 1 - standard output
;  mov ecx,hello        ; Put the offset of hello in ecx
;  mov edx,helloLen     ; helloLen is a constant, so we don't need to say
                       ;  mov edx,[helloLen] to get it's actual value
;  int 80h              ; Call the kernel

  mov eax,3
  mov ebx,0
  mov ecx,mytext
  mov edx, 20
  int 80h

  mov eax,4
  mov ebx,1
  mov byte [myvar], 65
  mov ecx, myvar
  mov edx, 1

  int 80h

  call convert

  mov eax,1            ; The system call for exit (sys_exit)
  mov ebx,0            ; Exit with return code of 0 (no error)
  int 80h


convert:   
    push rax 
    sub eax, 0x30
    pop rax
    ret
    
