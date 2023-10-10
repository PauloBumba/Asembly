section .text
global _start

_start:
    ; Subtrai o valor de 'y' de 'x'
    mov     eax, [x]
    sub     eax, '0'
    mov     ebx, [y]
    sub     ebx, '0'
    sub     eax, ebx       ; Realiza a subtração

    ; Converte o resultado em um caractere
    add     eax, '0'
    mov     [result], eax

    ; Escreve a mensagem na tela
    mov     ecx, msg
    mov     edx, len
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    ; Escreve o resultado na tela
    mov     ecx, result
    mov     edx, 1
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    ; Sair do programa
    mov     eax, 1
    int     0x80

section .data
    x db '5'
    y db '3'
    msg db  "Result of x - y is "
    len equ $ - msg

section .bss
    result resb 1