section .text
global _start

_start:
    ; Carregar os valores de 'x' e 'y' em registradores
    mov al, [x]
    sub al, '0'
    mov bl, [y]
    sub bl, '0'

    ; Realizar a operação OR
    or al, bl

    ; Converter o resultado em um caractere
    add al, '0'

    ; Armazenar o resultado em 'or_result'
    mov [or_result], al

    ; Escrever a mensagem na tela
    mov ecx, or_msg
    mov edx, or_len
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Escrever o resultado na tela
    mov ecx, or_result
    mov edx, 1
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Sair do programa
    mov eax, 1
    int 0x80

section .data
    or_msg db "OR operation of x and y is "
    or_len equ $ - or_msg

section .bss
    or_result resb 1