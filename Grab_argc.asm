BITS 64

section .data
        n db `\n`
        phraseOne db `Nom du fichier exécuté: `
        phraseOne_len equ $-phraseOne
        phraseTwo db `Argument 1: `
        phraseTwo_len equ $-phraseTwo

section .text
        global _start

_start:
        mov eax, 0x1
        mov edi, 1
        mov rsi, phraseOne
        mov rdx, phraseOne_len
        syscall
        mov eax, 0x1
        mov edi, 1
        mov rsi, [rsp+0x8]
        mov rdx, 0x10
        syscall
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
        mov rsi, [rsp+0x10]
        mov edx, 0x2
        syscall
        mov eax, 0x1
        mov edi, 1
        mov rsi, n
        mov rdx, 0x1
        syscall
        jmp exit

exit:
        mov eax, 0x3c
        mov edi, 0
        syscall
