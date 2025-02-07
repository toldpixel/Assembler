;Wenn x > 4 und y > 5 rechne x+y, wenn nicht x=y=0 

global _start

section .text

_start:   ; check if x > 4

  mov rax, [x]
  cmp rax, 4
  jg nextif ; if greater then jump to next if
  jmp else  ; if not then jump to else

  nextif: ;check if y > 5
  mov rax, [y]
  cmp rax, 5
  jg then ; if greater then jump to then
  jmp else  ; else jump to else

  then:     ; x+y
  mov rax, [x]
  mov rbx, [y]
  add rax, rbx
  mov [result], rax
  jmp printout

  else: ;x=y=0
  mov byte [x], 0
  mov byte [y], 0

  printout:
  ;print on screen
  add byte [result], 0x30
  mov rax, 1 ;write syscall
  mov rdi, 1 ;stdout
  mov rsi, result ;adress of buffer
  mov rdx, 1 ;size of buffer
  syscall

  ;exit the program
  mov al, 60
  mov rdi, 0
  syscall

section .data ;initialisierter Datenbereich

x: db 6
y: db 6
result: db 0

section .bss ;uninitialisierter Datenbereich
