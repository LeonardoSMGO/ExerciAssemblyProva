.data                  # declaração da seção de dados

ZERO: .float 0.0      # armazena um valor de ponto flutuante 0.0 em ZERO
UM: .float 1.0        # armazena um valor de ponto flutuante 1.0 em UM

# define uma macro para imprimir um valor de ponto flutuante
.macro PrintFloat()
  li $v0, 2             # carrega o código do syscall para imprimir float em $v0
  syscall               # chama o syscall
.end_macro              # finaliza a macro

# define uma macro para imprimir uma string
.macro Print(%str)
  .data                 # muda para a seção de dados
  msg: .asciiz %str     # armazena a string %str em msg
  .text                 # muda para a seção de texto
  li $v0, 4             # carrega o código do syscall para imprimir string em $v0
  la $a0, msg           # carrega o endereço da string a ser impressa em $a0
  syscall               # chama o syscall
.end_macro              # finaliza a macro

# define uma macro para ler um valor de ponto flutuante do usuário e armazená-lo em %save
.macro InputFloat(%save)
  li $v0, 6             # carrega o código do syscall para ler float em $v0
  syscall               # chama o syscall
  # add.s %save, $f1, $f0    # desativado (linha de código comentada): não faz nada útil
  mov.s %save, $f0     # move o valor lido para %save
.end_macro              # finaliza a macro

.text                  # declaração da seção de texto

loop:

Print("Digite um numero:")    # imprime a mensagem "Digite um número:"
InputFloat($f1)                # lê um valor de ponto flutuante e o armazena em $f1

mov.s $f12,$f0                # move o valor lido para $f12

lwc1 $f0, ZERO                # carrega o valor em ZERO para $f0
c.eq.s $f0, $f1              # compara $f1 com o valor em ZERO
bc1t finalizar               # se $f1 for igual ao valor em ZERO, pula para o finalizar

lwc1 $f5, UM                  # carrega o valor em UM para $f5
add.s $f10, $f10, $f5         # soma o valor em UM a $f10

soma:

add.s $f9, $f9, $f1           # soma $f1 a $f9

media:

div.s $f8, $f9, $f10          # calcula a média dos valores lidos

j loop                        # volta para o início do loop

finalizar:

Print("A soma é: \n")         # imprime a mensagem "A soma é:"
mov.s $f12, $f9               # move o valor da soma para $f12
PrintFloat()                  # imprime o valor da soma usando a macro PrintFloat

Print("\nA media é: ")         # imprime a mensagem "A média é:"
mov.s  $f12, $f8              # move o valor da média para $f12
PrintFloat()                  # imprime um valor float

li $v0, 10
syscall                       #encerra o programa





