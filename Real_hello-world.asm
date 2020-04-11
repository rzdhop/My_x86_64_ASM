BITS 64

section .data
	text: db "Hello word !", 0x0A, 0

section .text
	global _start

_start:
	mov rax, text
	call _print

	mov rax, 0x3c
	mov rdi, 0
	syscall
	
_print:
	push rax
	mov rbx, 0
_printloop:
	inc rbx
	inc rax
	mov cl, [rax]
	cmp cl, 0
	jne _printloop
	
	mov rax, 0x1
	mov rdi, 1
	pop rsi
	mov rdx, rbx
	syscall
	ret
	
