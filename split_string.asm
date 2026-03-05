;This program takes a string (which would come from a buffer that reads a file)
;and it splits it every time it encounters a separator (',' for example)

section .data
  input db "COLOR=13243, INTERVALO=251235, CARACTER=9", 0 	;test string, output should store in three registers a, b and c
  init_separator db "=",0
  fin_separator db ",", 0
  color db "Negro",0					;color puede ser 1:Rojo, 2:Verde, 3:Amarillo, 4:Azul
  intervalo db 100
  caracter db ",",0 
  newline db 10
section .bss
  charbuff resb 2
  wordbuff resb 1024					;This buffer stores a word from the string
section .text
global _start

_start:
  mov rsi, input 					;stores a pointer to input into rsi
  mov rdi, wordbuff					;stores a pointer to start of buffer  

 
next_char:
  mov al, [rsi]  					;loads into an 8 bit register the first character

  cmp al, 0      					;stop condition: reach end of string '0'
  je end_word_final


  cmp al, [init_separator]				;checks if the character is a separator
  je end_word
  
  cmp al, [fin_separator]
  je end_word

  cmp al, " "
  je skip_char

  mov [rdi], al						;store character
  inc rdi
  inc rsi
  jmp next_char    

 


done:
  mov rax, 60
  xor rdi, rdi
  syscall


end_word_final:
  mov byte [rdi],0
  call print_word
  jmp done

skip_char:
  inc rsi
  jmp next_char

end_word:
	;This subroutine adds a 0 at the end
  mov byte [rdi],0
  call print_word

  mov rdi, wordbuff

  inc rsi
  jmp next_char




print_word:

  push rsi 						;saves the data that was on rsi
  push rdi
  
  mov rdx, rdi
  sub rdx, wordbuff					;lenght = rdi - wordbuff  




;this prints a character
  mov rax, 1
  mov rdi, 1
  mov rsi, wordbuff
  syscall

	;print new line
  mov rax,1
  mov rdi,1
  mov rsi,newline 
  mov rdx,1
  syscall

  pop rdi
  pop rsi 						;to preserve rsi
   

  ret

set_color:


  ;This subroutine sets the color specified
  ;
