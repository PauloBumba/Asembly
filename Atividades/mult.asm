section .text
global _start

_start:
    ; Carregar os valores de 'x' e 'y' em registradores
    mov al, [x]
    sub al, '0'
    mov bl, [y]
    sub bl, '0'

    ; Realizar a multiplicação
    mul bl

    ; Converter o resultado em um caractere
    add al, '0'

    ; Armazenar o resultado em 'mul_result'
    mov [mul_result], al

    ; Escrever a mensagem na tela
    mov ecx, mul_msg
    mov edx, mul_len
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Escrever o resultado na tela
    mov ecx, mul_result
    mov edx, 1
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Sair do programa
    mov eax, 1
    int 0x80

section .data
    mul_msg db "Multiplication of x and y is "
    mul_len equ $ - mul_msg

section .bss
    mul_result resb 1