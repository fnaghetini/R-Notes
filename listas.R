######## LISTAS NO R

## Podemos unir todos os objetos vistos até agora (i.e. vetores,sequências,matrizes,
# arrays e fatores) e funções também em um conjunto de objetos chamado LISTA

## O objeto LISTA é um CONJUNTO DE OBJETOS. Cada OBJETO é um ELEMENTO da lista

## Os objetos de uma lista podem ser de tipos diferentes e apresentarem dimensões
# diferentes.



###### CRIAÇÃO DE LISTAS

## Existem duas formas de criar listas:
    #1 - Criamos todos os objetos desejados e reunimo-os em uma lista
    #2 - Criamos diretamente uma lista contendo vários objetos


##### CRIAÇÃO TIPO I: LISTA A PARTIR DO CONJUNTO DE OBJETOS

## Criação de um vetor com nomes de clientes:
nome_cliente <- c("Henrique","Cássia","Josefina","Camila")

## Criação de um vetor com as quantidades compradas por cada indivíduo:
qtde_cliente <- c(12,36,70,12)

## Criação de uma sequência que é o ID de cada cliente. O ID começa do 101:
ID_cliente <- seq(101,104)

## Criação de um vetor booleano/lógico que retorna T se o cliente é novo e F se não:
novo_cliente <- c(TRUE,FALSE,FALSE,TRUE)

## Criação de lista que reúne os 4 objetos acima:
balanco <- list(ID_cliente,nome_cliente,qtde_cliente,novo_cliente)
# OBS.: no output, o primeiro objeto da lista é referido como [[1]], etc...

## Podemos inserir na lista mais dois objetos: uma matriz e uma função.
balanco <- list(ID_cliente,nome_cliente,qtde_cliente,novo_cliente,
                matrix(0,nrow=4,ncol=5),mean(qtde_cliente))




##### CRIAÇÃO TIPO II: LISTA DIRETA

## Criamos os objetos (elementos da lista) diretamente na lista:
resultado <- list(ID=1:4,nomes=c("Julião","Ricarda","Berenice","Betilde"),
                  qtde=c(12,33,44,55),novo=c(TRUE,TRUE,FALSE,TRUE))

## A vantagem deste método de criação sobre o anterior é que, como foi atribuído
# um nome a cada objeto da lista, cada objeto aparece referenciado por seu nome.
# no método anterior, cada objeto era referenciado por seu índice [[i]].








###### NOMEAÇÃO DE ELEMENTOS DE LISTAS

## Caso utilizemos o primeiro método de criação de listas (aquele em que os objetos
# são criados primeiro e depois adicionados à lista), os elementos da lista (cada
# objeto) não apresenta um nome associado

## Há dois métodos principais:


##### NOMEAÇÃO DE ELEMENTOS DA LISTA QUE FORA CRIADA COMO UM CONJ. DE OBJETOS (I)

## Podemos utilizar a primeira lista criada e atribuir nomes a cada elemento:
balanco_nomes <- list(ID=ID_cliente,Nome=nome_cliente,Qtde=qtde_cliente,
                      Novo=novo_cliente,matriz=matrix(0,nrow=4,ncol=5),
                      funcao=mean(qtde_cliente))



##### NOMEAÇÃO DE ELEMENTOS DA LISTA - NAMES(lista) <- c()

## Podemos atribuir nomes a cada elemento da lista "anterior "balanco":
names(balanco) <- c("ID","Nome","Qtde.","Novo","Matriz","Média de Qtde.")








###### PESQUISA/ACESSO DE ELEMENTOS EM LISTAS


##### ACESSO A ELEMENTOS DA LISTA PELO NOME DO OBJETO

## Podemos acessar elementos/objetos da lista pelo nome:
balanco$ID
balanco$Nome
balanco$Qtde.




##### ACESSO A ELEMENTOS DA LISTA PELO NOME - nome_lista$nome_elemento

## Podemos acessar um item do vetor "Nome":
balanco$Nome[2]
balanco$Nome[3]
## Podemos acessar um item do vetor "`Média de Qtde.`"
balanco$`Média de Qtde.` # Só tem um item, então pesquisei um objeto
## Podemos acessar o primeiro e o último itens do vetor "Nome":
balanco$Nome[c(1,4)]
## Podemos acessar os três primeiros itens do vetor "ID":
balanco$ID[1:3]



##### ACESSO A ELEMENTOS DA LISTA PELO ÍNDICE - [[]]

balanco[[2]]
balanco[[4]]
balanco[[5]]
## Posso salvar o resultado de uma pesquisa numa variável:
historico <- balanco[[5]]








###### MODIFICAÇÃO DE ELEMENTOS EM UMA LISTA

##### MODIFICAÇÃO DE UM ITEM DE UM ELEMENTO(VETOR):
# Fica salvo definitivamente
balanco$Nome[1] <- "Marcos"
balanco$Nome[3] <- "Maria"


##### MODIFICAÇÃO DE VÁRIOS ITENS DE UM ELEMENTO(VETOR):
balanco$Qtde.[c(1,3)] <- c(33,44)


##### MODIFICAÇÃO DE UM INTERVALO DE ITENS DE UM ELEMENTO(VETOR):
balanco$Qtde.[1:3] <- c(22,33,44)


##### MODIFICAÇÃO DE UM LINHA DE UM ELEMENTO (MATRIZ):
balanco$Matriz[1,] <- seq(4,8)
balanco$Matriz[2,] <- 2:6


##### MODIFICAÇÃO DE UMA COLUNA DE UM ELEMENTO (MATRIZ):
balanco$Matriz[,2] <- c(22,44,55,11)


##### MODIFICAÇÃO DE UM ELEMENTO DE UMA MATRIZ DE UMA LISTA:
balanco$Matriz[3,3] <- 99


##### MODIFICAÇÃO DE UM ELEMENTO DE UM VETOR BOOLEANO:
balanco$Novo[3] <- FALSE


##### EXCLUSÃO DE UMA PARTE DE UM ELEMENTO DA LISTA:
# A exclusão não é permanente. Devemos salvar a exclusão em uma variável
balanco$Matriz[,-4]


##### ADIÇÃO DE UM ELEMENTO A UM VETOR QUE PERTENCE A LISTA:
# A adição é permanente!
balanco$Nome[5] <- "Joaquim"


##### ADIÇÃO DE UM INTERVALO DE ELEMENTOS A UM VETOR DA LISTA:
balanco$Nome[6:8] <- c("Júlia","Lúcio","Luiz")
balanco$Qtde.[5:8] <- c(22,11,45,55)


##### EXCLUSÃO DE UM INTERVALO DE UM VETOR DA LISTA:
balanco$Nome <- balanco$Nome[-(5:8)]
balanco$Qtde. <- balanco$Qtde.[-c(5,6,7,8)]


##### NOMEAÇÃO DE COLUNAS DE UMA MATRIZ QUE PERTENCE A UMA LISTA:
colnames(balanco$Matriz) <- c("Jan","Fev","Mar","Abr","Mai")


##### NOMEAÇÃO DE LINHAS DE UMA MATRIZ QUE PERTENCE A UMA LISTA:
rownames (balanco$Matriz) <- balanco$Nome


##### REMOÇÃO DE UM ELEMENTO/OBJETO DA LISTA:
# Para isso usamos [] e não [[]]
balanco <- balanco[-6]
balanco <- balanco[-6]








###### OPERAÇÕES DE ELEMENTOS DE UMA LISTA

## Podemos fazer operações normais com a lista (soma, divisão,multiplicação,etc)

## Existem operações próprias de listas (e.g. Combinação e transformação de listas)



##### COMBINAÇÃO DE LISTAS

## Essa operação serve para combinar resultados apresentados por duas listas em
# uma só lista

## É útil para combinarmos resultados parciais (listas) em um resultado final
# (lista_final)

## Vamos criar uma lista pelo método II:
lista_info <- list(Data="26-05-20",Gestor="Camila",Mes="Maio")

## Podemos então combinar essa nova lista à lista "balanco" anterior. Para isso,
# é muito simples, basta concatenarmos os dois "c()". A ordem da concatenação 
# mostra quais elementos da lista resultante aparecerão primeiro
lista_final <- c(balanco,lista_info)

## Podemos combinar/concatenar quantas listas quisermos



##### TRANSFORMAÇÃO DE LISTAS

## Podemos, p.e., tranformar listas em vetores. Isso é útil quando temos uma lista
# muito grande e fica difícil buscar elementos na lista

#### TRANFORMAÇÃO DE LISTAS EM VETORES - UNLIST(LISTA)
vetor <- unlist(lista_final)

## Podemos agora buscar os elementos da vetor resultante pelo índice:
vetor[1]
vetor[22]
vetor[30]
## Note que cada elemento do vetor recebe um label

## É muito útil, pq só devemos trabalhar com um índice, ao invés de trabalharmos 
# com o nome do elemento da lista e depois o índice
vetor[1] == lista_final$ID[1]







###### QUESTÕES SOBRE LISTAS

##### QUESTÃO 1: Criar 3 listas com informações de cada cliente.

Marcos <- list(Nome="Marcos",Salario=4000,
               Gasto=c(334,356,544),Idade=40)

Paulo <- list(Nome="Paulo",Salario=5000,
              Gasto=c(230,280,399),Idade=66)

João <- list(Nome="João",Salario=10000,
             Gasto=c(120,255,270),Idade=50)

## OBS.: Note que cada elemento da lista pode ser de um tipo diferente. Ou seja,
# pelo fato de "Nome" ser um caracter, "Salario" não é obrigatoriamente.



##### QUESTÃO 2: Criar um outro elemento nas listas que retorna a média dos gastos

Marcos[5] <- mean(Marcos$Gasto)

Paulo[5] <- mean(Paulo$Gasto)

João[5] <- mean(João$Gasto)


