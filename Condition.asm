BITS 64
%define len 256

section .bss
        userName resb len
        secondChoice resb len

section .data
        n db `\n`
        phraseOne db `Comment tu t'appelle ?(0: quit)\n>`
        phraseOne_len equ $-phraseOne
        phraseTwo db `Salut, `
        phraseTwo_len equ $-phraseTwo

section .text
        global _start

_start:
        mov eax, 0x1
        mov edi, 1
        mov rsi, phraseOne
        mov rdx, phraseOne_len
        syscall

        mov eax, 0x00
        mov edi, 1
        mov rsi, userName
        mov rdx, len
        syscall
        push rsi

        cmp byte [rsi], 48
        je _exit
        cmp byte [rsi], 49
        je _writeName

        mov eax, 0x1
        mov edi, 1
        mov rsi, phraseOne
        mov rdx, phraseOne_len
        syscall
        mov eax, 0x00
        mov edi, 1
        mov rsi, secondChoice
        mov rdx, len
        syscall

        cmp byte [rsi], 48
        je _exit
        cmp byte [rsi], 49
        je _writeName
        jne _exit


_writeName:

        mov eax, 0x1
        mov edi, 1
        mov rsi, n
        mov rdx, 0x1
        syscall
        mov eax, 0x1
        mov edi, 1
        mov rsi, phraseTwo
        mov rdx, phraseTwo_len
        syscall
        mov eax, 0x1
        mov edi, 1
        pop rsi
        mov edx, len
        syscall

        mov eax, 0x1
        mov edi, 1
        mov rsi, n
        mov rdx, 0x1
        syscall
        jmp _exit

_exit:
        mov eax, 0x3c
        mov edi, 0
        syscall
