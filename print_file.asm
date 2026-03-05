;This program checks if there exists "notas.txt" in the same directory
;if it does it prints it out
;contrary case it prints "File not found"



section .data
  pathname db "./notas.txt", 0
  errormsg_nofile db "File not found", 10
  errorlen_nofile equ $ - errormsg_nofile

section .bss

  buffer resb 1024

section .text

  global _start 

_start:

  ;open file in 'pathname'
  mov rax, 2
  mov rdi, pathname
  mov rsi, 0
  mov rdx, 0
  syscall
  
  cmp rax,0 ; if rax is negative notas.txt does not exist
  js open_failed ;jump to open_failed
  mov r12, rax ;save the file identifier into r12


  ; read file
  mov rax, 0
  mov rdi, r12
  mov rsi, buffer
  mov rdx, 1024
  syscall
 
  mov r13, rax        ; number of bytes read

  ; write
  mov rax, 1
  mov rdi, 1
  mov rsi, buffer
  mov rdx, r13
  syscall

  ; exit
  mov rax, 60
  xor rdi, rdi
  syscall

open_failed:
  mov rax,1
  mov rdi,1
  mov rsi, errormsg_nofile
  mov rdx, errorlen_nofile
  syscall

  mov rax, 60
  mov rdi, 1
  syscall
