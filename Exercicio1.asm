.data

pergunta: .asciiz "Digite o ano:"                           #cria a pergunta pro ususario
msg1: .asciiz "Voce é menor idade!"                         #é criada a mensagem de que ele é menor de idade
msg2: .asciiz "Voce poderá ter carteira de habilitação!"    #é criada a mensagem de que ele esta podera ter a habilitação
                                              
.text

li $v0, 4                                                   #é carregado os metodos que realizarão a pergunta para o usuario armazenando o ano de nascimento ele em um registrador temporario
la $a0, pergunta                                            
syscall

li $v0, 5
syscall

move $t1, $v0                                              #move o valor digitado para a variavel temporaria que servirá de comparação
li $t0, 2005



blt $t1, $t0, menor                                        #é realizado o metodo de comparação de Branch less Than para verificar(comparando) se o ano que será digitado será menor que o ano parametro



bge $t1, $t0, maior                                        #é realizado o metodo de comparação de Branch Greater or Equal para verificar(comparando) se com base no ano de nascimento digitado, a pessoa esta apta a ter habilitação                                 

menor:
li $v0, 4
la $a0, msg1                                              #nessa parte fica armazenada a mensagem de quando a pessoa não poder ter habilitação
syscall

li $v0, 10                                                #encerra a parte que fica armazenada a sua condição
syscall

maior:
li $v0, 4
la $a0, msg2                                             #nessa parte fica armazenada a mensagem de quado a pessoa esta apta para ter a habilitação
syscall

li $v0, 10                                               #finaliza o programa encerrando a parte que fica sua codição
syscall
