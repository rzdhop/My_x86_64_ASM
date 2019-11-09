BITS 64

section .data
        var_text: db `This is a text \n`
        var_text_len: equ $-var_text

section .text
        global _start

_start:
        mov ax, 0x01
        mov di, 1
        mov rsi, var_text
        mov edx, var_text_len
        syscall

        mov ax, 0x3c
        mov di, 0
        syscall
