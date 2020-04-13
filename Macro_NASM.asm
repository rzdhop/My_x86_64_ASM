BITS 64
;%include "assets/fuction.inc"
SYS_EXIT equ 0x3c
SYS_WRITE equ 0x01
STDOUT equ 0x01

%macro printRAX 2
	mov rax, SYS_WRITE
	mov rdi, STDOUT
	mov rsi, %1
	mov rdx, %2
	syscall
%endmacro

%macro exit 0
	mov rax, SYS_EXIT
	mov rdi, 0
	syscall
%endmacro

section .data
	text: db "Hello word !", 0x0A, 0
	text_len: equ $-text

section .text
	global _start

_start:
	printRAX text, text_len
	exit
