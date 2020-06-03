######## CONSTRUÇÃO DE FUNÇÕES NO R

## As funções são úteis para armazenar passos que serão utilizados novamente com
# certa frequência. Ao invés de digitarmos 100 linhas de código toda vez que queremos
# executar uma determinada rotina, podemos criar funções para otimizar o workflow.


###### OPERADORES LÓGICOS

##### OPERADORES DE IGUALDADE - "=="

## Vamos criar vetores:
fornecedor <- c('Camila','Franco','Marcos','Maria','Leticia','Carlindo')
vendas_jan <- c(12,25,30,12,56,8)
vendas_fev <- c(12,25,14,20,8,12)
vendas_mar <- c(8,22,33,44,85,9)
## Vamos criar um dataframe a partir desses vetores:
geral <- data.frame(Fornecedor=fornecedor,
                    Janeiro=vendas_jan,
                    Fevereiro=vendas_fev,
                    Março=vendas_mar)
## Vamos verificar a estrutura desse df:
str(geral)

## Vamos comparar alguns valores com operadores de igualdade:
geral$Janeiro[2] == 25 # Retorna TRUE
geral$Fevereiro[3] == 2 # Retorna FALSE
geral$Fornecedor[5] == "Leticia" # Retorna TRUE
sum(geral$Janeiro) == 143 # Retorna TRUE



##### OPERADORES DE DESIGUALDADE - "!="
sum(geral$Fevereiro) != 230 # Retorna TRUE
geral$Março[2] != 22 # Retorna FALSE
geral$Fornecedor[3] != "Marcos" # Retorna FALSE







###### OPERADORES COMPARATIVOS - ">, <, >=, <="

## Vamos fazer algumas comparações:
geral$Janeiro[2] > 20 # Retorna TRUE
geral$Fevereiro[5] <= 7 # Retorna FALSE
geral$Março[3] >= 33 # Retorna TRUE
geral$Janeiro > 20 # Retorna um vetor booleano







###### OPERADORES DE CONJUNTO - "E -> &", "OU -> |"

## E -> &:
  # F + F = F
  # F + T = F
  # T + F = F
  # T + T = T

## OU -> |:
  # F + F = F
  # F + T = T
  # T + F = T
  # T + T = T

##### OPERADOR &:
geral$Janeiro[2] > 20 & geral$Fevereiro[5] <= 8 # Retorna TRUE
geral$Março[4] <= 50 & geral$Janeiro[3] <= 1 # Retorna FALSE




##### OPERADOR |:
geral$Março[4] <= 50 | geral$Janeiro[3] <= 1 # Retorna TRUE
geral$Março[3] > 50 | geral$Fevereiro[4] > 100 # Retorna FALSE








###### LOOP COM "FOR" E COMANDO "CAT()"

## É útil quando queremos executar o mesmo procedimento para todas as variáveis.
# Ao invés de fazermos isso para cada uma individualmente, podemos usar um loop
# "for" e automatizar essa tarefa.

## Forma genérica:
    # for (i in intervalo){                        }

## Vamos adicionar uma quinta coluna ao df:
geral$Abril <- c(12,25,33,25,14,8)

## Temos que transformar a variável "Fornecedores" (factor -> character):
geral$Fornecedor <- as.character(geral$Fornecedor)

## Queremos que o usuário revise os pedidos de Abril antes de enviá-lo:
for (i in 1:nrow(geral)){
  cat("O vendedor",geral$Fornecedor[i],"solicitou",geral$Abril[i],"unidades. \n")
}

## O comando "cat()" serve para imprimir valores da seguinte forma:
      # cat("texto",variavel,"texto",variavel,"texto"...)
## Devemos colocar \n no último texto caso quisermos pular de linha após a 
# primeira iteração

## Repare na sintaxe do intervalo







###### LOOP COM "WHILE"

## Forma geral:
    # while(condição){            comando 1, comando2               }

## Utilizaremos o mesmo exemplo para obter os mesmos resultados com o while:

## Inicializamos a variável "j" para montarmos a condição:
j <- 1
## Construção do while:
while(j<=nrow(geral)){
  cat("O vendedor",geral$Fornecedor[j],"solicitou",geral$Abril[j],"unidades. \n")
  j <- j + 1
}
## É melhor colocar uma condição genérica como essa do que um número (no caso, 6)








###### DECISION MAKING - IF, ELSE E FOR

##### COMANDO IF

## Forma geral:
    # if(condicao) {comando1, comando2}
## Vamos criar uma variável no nosso df a respeito da capacidade de cada fornecedor
geral$Capacidade <- c(50,60,40,15,10,15)

## Vamos usar um if simples:
i <- 3
if(geral$Março[i] <= geral$Capacidade[i]){
  print ("O pedido pode ser realizado.")
}




##### COMANDO ELSE

## Forma geral
    # else {comando1,comando2,...}

## Continuando o exemplo anterior:
i <- 4
if(geral$Março[i] <= geral$Capacidade[i]){
  print ("O pedido pode ser realizado.")
} else 
  {print("Não é possível efetuar o pedido.")}

## É melhor deixar o "else" na mesma linha do fechamento da chave do "if"

## Podemos usar "if's" dentro do "else"

## O "elif" no R é escrito como "else if"




##### COMANDO IF, ELSE E FOR COMBINADOS

## Queremos averiguar recursivamente se todos os pedidos atendem a capacidade
for(i in 1:nrow(geral)){
  if(geral$Março[i] <= geral$Capacidade[i]){
    cat("O pedido de",geral$Fornecedor[i],"pode ser efetuado \n")
  }else
  {cat("O pedido de",geral$Fornecedor[i],"NÃO pode ser efetuado \n")}
}








###### CRIAÇÃO DE FUNÇÕES - FUNCTION()

## Vamos criar uma função que retorna a variância de teores:

# Criação de vetores e depois de um df:
x <- c(1:6)
y <- c(6:11)
au <- c(0.8,0.99,0.7,0.01,0.55,0.88)
cu <- sample(1:10,6)
df <- data.frame(X=x,Y=y,Au=au,Cu=cu)

# Criação da função:
variancia <- function(vetor) {
  media <- mean(vetor)
  n <- length(vetor)
  vari <- sum((vetor - media)^2)/n
  return(vari)
  }
variancia(df$Au)
variancia(df$Cu)
