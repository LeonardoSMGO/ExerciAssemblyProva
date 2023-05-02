.macro InputInt(%save)   #cria uma macro para o numero de itens no estoque

li $v0, 5
syscall                  #le o valor do numero de itens no estoque do $v0 para o %save
move %save, $v0


.end_macro                #finaliza a macro


.macro PrintInt(%a)      #cria a macro para um print inteiro

li $v0, 1
add $a0, $zero, %a       #le o valor digitado e adiciona ao estoque
syscall

.end_macro              #finaliza a macro

.macro Print(%str)       #cria uma macro para um print de string

.data

msg: .asciiz %str       #define a oque o msg pertence

.text

li $v0, 4
la $a0, msg           #le a informação que estiver armazenada em msg
syscall

.end_macro           #finaliza a macro


.text

Print("Digite a quantaidade inicial do estoque:")   #é criada a menssagem do numero já existente de itens no estoque junto do seu print
InputInt($t0)

j menu   #jump para o menu

menor:

Print("A quantidade de estoque é menor que zero")  #é criado o caso de quando o numero de itens no estoque for zero


j menu   #jump para o menu


verificaçao:

blt $t0, 1, menor    #é criada a verificação de menor ou igual


menu:

Print("\n 1 - Inserir item \n 2 - Remover Item \n 3 - Consultar item \n 4 - Encerrar operação \n")  #cri-se a interface do menu de escolha
InputInt($t9)



escolher:

beq $t9, 1, inserir
beq $t9, 2, remover
beq $t9, 3, consultar      #é criada as opções com seu respectivo numero de comando
beq $t9, 4, finalizar

inserir:

Print("\nDigite a quantidade que deseja incerir:")   #é criado a forma do caso de quando o usuario desejar inserir algum item
InputInt($t3)

add $t0, $t0, $t3   #seu metodo de adiçaõ

j verificaçao       #jump para verificar seu processo

remover:

Print("\nDigite a quantidade que deseja remover:")   #é craido a forma de caso de quando o usuario desejar remover algum item
InputInt($t3)

sub $t0, $t0, $t3 #seu metodo de remoção

j verificaçao  #jump para sua verificação


consultar:

PrintInt($t0)  #aqui fica responsavel pela forma de como ele ira visualizar o atual numero de itens no estoque

j verificaçao  #jump para sua verificação

finalizar:     #metodo para finalizar o programa quando o usuario digitar o 4

li $v0, 10     #realizando finalização
syscall







