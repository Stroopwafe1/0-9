section .data
	digit db 0,10 ; Store 2 bytes

section .text
	global _start

_start:
	push 0
looping:
	mov [rsp], rax		; Set the value of the top of the stack to rax
	call printRAXDigit 	; Call our function below
	pop rax			; Pop the stack into rax
	add rax, 1		; Increment rax
	push rax		; Push new value to the stack
	cmp rax, 9		; Compare rax to 9
	jle looping		; Jump to start of the loop if less or equal to 9

exit:
	mov rax, 60		; Exit with status 0
	mov rdi, 0
	syscall

printRAXDigit:
	add rax, 48 		; Turn RAX into ASCII number
	mov [digit], al 	; Move last byte from rax register into digit (replacing null-byte)
	mov rax, 1		; Print number
	mov rdi, 1
	mov rsi, digit
	mov rdx, 2
	syscall
	ret
