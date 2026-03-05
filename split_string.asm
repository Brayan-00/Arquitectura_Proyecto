;This program takes a string (which would come from a buffer that reads a file)
;and it splits it every time it encounters a separator (',' for example)

section .data
  input db "COLOR=3, INTERVALO=25, CARACTER=@", 0 	;test string, output should store in three registers a, b and c
  init_separator db "=",0
  fin_separator db ",", 0
  color db "Negro",0					;color puede ser 1:Rojo, 2:Verde, 3:Amarillo, 4:Azul
  intervalo db 100
  caracter db ",",0 

section .bss
  charbuff resb 2
section .text
global _start

_start:
  mov rsi, input 					;stores a pointer to input into rsi
  
next_char:
  mov al, [rsi]  					;loads into an 8 bit register the first character

  cmp al, 0      					;stop condition: reach end of string '0'
  je done

  ;cmp al, init_separator  

  ;call print_char


  inc rsi       					;goes to next character
  jmp next_char


done:
  mov rax, 60
  xor rdi, rdi
  syscall

print_char:

  push rsi 						;saves the data that was on rsi

  ;this prints a character
  mov [charbuff], al 					;stores the character into memory
  mov byte [charbuff+1], 10 				;adds \n to the end of the line
  mov rax, 1
  mov rdi, 1
  mov rsi, charbuff
  mov rdx, 2
  syscall

  pop rsi 					;to preserve rsi

  ret

set_color:


  ;This subroutine sets the color specified
  ;
