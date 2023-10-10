section .data
    x db '5'
    y db '3'
    msg db  "sum of x and y is "
    len equ $ - msg

section .text
global _start

_start:
    ; Carregar os valores de 'x' e 'y' em registradores
    mov al, [x]
    sub al, '0'
    mov bl, [y]
    sub bl, '0'

    ; Realizar a adição
    add al, bl

    ; Converter o resultado em um caractere
    add al, '0'

    ; Armazenar o resultado em 'sum'
    mov [sum], al

    ; Escrever a mensagem na tela
    mov ecx, msg
    mov edx, len
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Escrever o resultado na tela
    mov ecx, sum
    mov edx, 1
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Sair do programa
    mov eax, 1
    int 0x80

segment .bss
    sum resb 1