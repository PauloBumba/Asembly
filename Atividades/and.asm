section .text
global _start

_start:
    ; Carregar os valores de 'x' e 'y' em registradores
    mov al, [x]
    sub al, '0'
    mov bl, [y]
    sub bl, '0'

    ; Realizar a operação AND
    and al, bl

    ; Converter o resultado em um caractere
    add al, '0'

    ; Armazenar o resultado em 'and_result'
    mov [and_result], al

    ; Escrever a mensagem na tela
    mov ecx, and_msg
    mov edx, and_len
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Escrever o resultado na tela
    mov ecx, and_result
    mov edx, 1
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Sair do programa
    mov eax, 1
    int 0x80

section .data
    and_msg db "AND operation of x and y is "
    and_len equ $ - and_msg

section .bss
    and_result resb 1