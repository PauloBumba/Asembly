section .data
    ax db 5       ; Valor de 'ax'
    bx db 3       ; Valor de 'bx'
    result db 0   ; Variável para armazenar o resultado

section .text
global _start

_start:
    ; Carregar os valores de 'ax' e 'bx' em registradores
    mov al, [ax]
    sub al, '0'
    mov bl, [bx]
    sub bl, '0'

    ; Multiplicar 'ax' por 'bx' (ax * bx)
    mul bl

    ; Somar 'bx' com o resultado da multiplicação (bx + ax * bx)
    add bl, al

    ; Multiplicar 'ax' pelo resultado anterior (ax * (bx + ax * bx))
    mov al, [ax]
    sub al, '0'
    mul bl

    ; Converter o resultado em um caractere
    add al, '0'

    ; Armazenar o resultado em 'result'
    mov [result], al

    ; Escrever o resultado na tela
    mov ecx, result
    mov edx, 1
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Sair do programa
    mov eax, 1
    int 0x80