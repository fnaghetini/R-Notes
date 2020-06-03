######## FATORES NO R
## Está relacionado a como o R entende variáveis categóricas (variáveis 
# do tipo caracter que temos poucos valores únicos - e.g. sexo,estado civil,
# litologia,etc). Os fatores são atribuições numéricas a essas categorias.
## Portanto, não faz sentido fazermos operações com esses objetos (média, 
# DP, subtração, soma, etc). Fazemos operações ESPECIAIS com fatores.
## Os fatores são vetores especiais por representarem variáveis categóricas


###### CRIAÇÃO DE FATORES

## A primeira forma de se criar um fator é utilizar tranformar uma variável
# existente (e.g. um vetor) em um fator


##### CRIAÇÃO DE FATORES COM BASE NA CONVERSÃO DE UM TIPO DE OBJETO

## Criação de um vetor:
genero <- c("1","1","2","3","3","2","2")
## Transformação do vetor para um fator:
genero_fac <- as.factor (genero)
# OBS.: repare no output que os fatores retornam os valores únicos (níveis)
# que pertencem a ele em "levels".




##### CRIAÇÃO DE FATORES DIRETAMENTE

## Podemos criar fatores diretamente com "factor()"
rochas <- factor(c(1,2,3,2,2,2,1,2,3,3,3,3,2,2,1,1,1,1,1))




##### ESTRUTURA (TIPO) DE UMA VARIÁVEL
## Utiliza-se o comando "str()"
## Análogo ao "type()" do python

str(genero) # variável do tipo caracter com 7 elementos [1:7]
str(genero_fac) # variável do tipo fator com 3 níveis
str(rochas) # variável do tipo fator com 3 níveis








###### ACESSO DE FATORES
## O acesso de fatores é idêntico ao acesso de vetores

##### ACESSO A UM ELEMENTO DO FATOR
rochas[5] # o quinto elemento do fator corresponde ao tipo de rocha 2
rochas[7] # o sétimo elemento do fator corresponde ao tipo de rocha 1



##### ACESSO A UM INTERVALO DO FATOR
rochas[3:8] # retorna do terceiro ao oitavo elemento do fator
rochas[1:6] # retorna do primeiro ao sexto elemento do fator


##### ACESSO A APENAS ALGUNS ELEMENTOS DO FATOR
rochas[c(1,4,6,8)] # retorna apenas os elementos selecionados



##### ACESSO AO ÚLTIMO ELEMENTO DO FATOR
## Utiliza-se a função de comprimento "length()" para acessar o último elemento
rochas[length(rochas)]








###### MODIFICAÇÃO DE FATORES
## A modificação de fatores é idêntica à modificação de vetores.

##### MODIFICAÇÃO DE APENAS UM ELEMENTO DO FATOR
rochas[5] <- 3 # o quinto elemento do fator foi substituído por "3"
rochas[3] <- 2 # o terceiro elemento do fator foi substituído por "2"








###### OPERAÇÕES COM FATORES
## Utilizamos operações especiais com fatores. Não faz sentido aplicarmos
# operações triviais a eles (média,DP,soma,subtração,etc)



## Vamos criar dois fatores:
rochas_igneas1 <- factor(c("basalto","gabro","granito","gabro","granito",
                          "basalto","basalto","granito","granito"))

rochas_igneas2 <- factor(c("granito","granito","gabro",
                            "basalto","basalto","fonolito","gabro"))


##### BIBLIOTECA "FORCATS"
## OBS.: tive que baixar o pacote "tidyverse"

## Importação biblioteca "forcats"
library(forcats)

#### COMBINAÇÃO DE FATORES - "fct_c()"
## Os fatores que serão combinados não precisam ter o mesmo tamanho e
# não precisam ter os mesmos níveis

rochas_igneas <- fct_c(rochas_igneas1,rochas_igneas2)
# OBS.: os níveis do fator resultante da combinação serão a soma de todos
# os níveis presentes em cada fator utilizado para a combinação
# OBS.: os níveis comuns aos dois fatores não se repetem








###### MODIFICANDO/CRIANDO LABELS PARA FATORES - lvls_revalue(),levels(),fct_recode()

## lvls_revalue() -> não modifica os níveis dos fatores. Cria labels para
# os níveis. Deve-se criar uma nova variável para armazenar esses labels.
# É melhor trabalhar com essa, pois é mais recente e intuitiva.

## levels() -> modifica definitivamente os níveis dos fatores. É utilizado
# também para chamar os níveis de um fator. Não é muito bom usar essa função,
# pois ela é obsoleta.

## fct_recode() -> é utilizada para alterar apenas um ou mais níveis ESPECÍFICOS
# de um fator. "lvls_revalue()" só consegue modificar TODOS os níveis! Assim 
# como "lvls_revalue()", não há modificação definitiva dos níveis.


## Vou acrescentar alguns valores ao fator "rochas"
rochas[20:24] <- c(1,1,1,1,2)
length(rochas)


## Podemos utilizar "lvls_revalue()" da biblioteca "forecats" para criar labels:
rochas_labels <- lvls_revalue (rochas,c("Quartzito","Siltito","Arenito"))
## Podemos plotar a fator:
plot(rochas_labels)


## A função "levels()" retorna os níveis de um fator:
levels(rochas)
levels(rochas_labels)
## Podemos modificar (definitivamente) os níveis de um fator com essa função:
levels(rochas_labels) <- c("Gnaisse","Fonolito","BIF")
## Podemos plotar o fator modificado:
plot(rochas_labels)


## Podemos utilizar "fct_recode()" para modificarmos apenas ALGUNS níveis
# definidos em um fator
fct_recode (rochas_labels,"TTG" = "Gnaisse")
## Para gravarmos essa modificação, devemos atualizar a variável
rochas_labels <- fct_recode (rochas_labels,"TTG" = "Gnaisse")
## Plot do fator:
plot(rochas_labels)








##### AGRUPAMENTO DE NÍVEIS DE FATORES

## Esse tipo de prática é extremamente útil para padronizar as categorias de
# um fator. Por exemplo, se uma empresa monta um formulário para os clientes
# responderem como chegaram até o site, é provável que haja várias respostas
# com a mesma informação(i.e. "Pela internet","internet","Internet",etc). Essa
# PADRONIZAÇÃO de entradas é feita por AGRUPAMENTO DE NÍVEIS.


## Vamos criar um fator:
como_soube <- factor(c("Internet","internet","net", "google","pesquisa na web",
                     "amigo","amiga","uma pessoa","Linkedin"))


## Nesse caso, podemos AGRUPAR NÍVEIS."Internet","internet","net", "google",
# "pesquisa na web","Linkedin" poderiam ser agrupados em um nível "Internet".


#### AGRUPAMENTO PARA PADRONIZAR NÍVEIS - FCT_COLLAPSE() 

##Função "fct_collapse()" agrupa os níveis. Observe que foi criado um 
# fator resultante que padronizou os níveis
fct_collapse (como_soube,Internet=c("Internet","internet","net", "google",
                           "pesquisa na web","Linkedin"),
              Pessoa=c("amigo","amiga","uma pessoa"))
## Devemos armazenar em uma variável:
pad <- fct_collapse (como_soube,Internet=c("Internet","internet","net", "google",
                                           "pesquisa na web","Linkedin"),
                     Pessoa=c("amigo","amiga","uma pessoa"))

## Podemos plotar "pad":
plot(pad)


#### AGRUPAMENTO POR NÍVEIS MAIS FREQUENTES - FCT_LUMP()
## Vc define o número de níveis mais frequentes e os outros serão 
# agrupados num mesmo nível outros


## Criando um fator:
estado_civil <- factor(c("solteiro","solteiro","solteiro","casado",
                         "casado","divorciado","casado","divorciado",
                         "divorciado","solteiro","solteiro", "união estável",
                         "união estável", "solteiro", "casado","casado"))
## Plotando o fator:
plot(estado_civil)
## Usando "fct_lump()":
ag <- fct_lump(estado_civil,2,other_level="Outros")
## Plotando o novo fator agrupado pelos 2 níveis mais frequentes:
plot(ag)







##### REORDENAÇÃO DE NÍVEIS

## O R ordena os níveis,por default, em ordem alfabética. Então,devemos reordenar
# níveis de uma variável categórica ordinal (representada por um fator)
## A reordenação de níveis se aplica a variáveis categóricas ordinais
# (variáveis qualitativas ordinais)

## TIPOS DE ORDENAÇÃO:

# Ordenação alfabética -> padrão do R

# Ordenação racional -> medio < superior < mestrado -> fct_relevel()

# Ordenação por variável externa -> ordenar o "nível de escolaridade" de acordo
# com uma variável externa "faturamento" -> fct_reorder()

## Criação de fator:
escolaridade <- factor(c("medio","superior","mestrado","superior","medio",
                         "doutorado","mestrado","superior","medio","medio",
                         "medio","superior","superior","mestrado","medio"))

## Note que os níveis do fator abaixo estão em ordem alfabética. Queremos 
# reordenar este fator


#### REORDENAÇÃO DE NÍVEIS RACIONAL - "FCT_RELEVEL()"
reord <- fct_relevel(escolaridade ,c("medio","superior","mestrado","doutorado"))
plot(reord)
## Repare que o número que identifica cada nível continua o mesmo,mas o fator
# foi reordenado


#### REORDENAÇÃO DE NÍVEIS POR UMA VARIÁVEL EXTERNA - "FCT_REORDER()"

## O fator e a variável externa devem ter o mesmo tamanho, pois cada elemento
# "i" do fator corresponde ao elemento "i" da variável externa

## Criação de variável externa "faturamento":
faturamento <- c(10,24,40,30,12,60,30,25,13,14,9,25,20,30,10)

## Usando função "fct_reorder()":
ext <- fct_reorder (escolaridade,faturamento,mean)
## Observe os levels do output. No caso, o resultado da ordenação por variável 
# externa foi igual ao da ordenação racional







###### COMANDO "GL()"

## Forma geral:
  # gl(n, k, length = n*k, labels = seq_len(n))
      # n -> número (int) de níveis
      # k -> número (int) com o número de repetições adjacentes de cada nível
      # length= -> n*k
      # labels=c() -> labels dos níveis (números ou caracteres)

## Gera fatores com a definição do número de níveis, repetição adjacente 
# dos níveis e valores/labels dos níveis

f<-gl(3,2,labels=c("Recife","Rio de Janeiro","Brasília"))







####### QUESTÕES SOBRE FATORES

##### QUESTÃO 1: Crie um fator que guarde o resultado destes pedidos de 
# empréstimos

## Criação do fator:
emprestimos <- factor(c("Aprovado","Reprovado","Reprovado","Reprovado",
                          "Reprovado","Aprovado","Reprovado","Reprovado",
                          "Aprovado","Reprovado","Aprovado","Aprovado"))

## Reordenação racional do fator (mesmo que a variável não seja ordinal.
# Fiz a ordenação só pra brincar):
ordem <- fct_relevel(emprestimos,c("Aprovado","Reprovado"))

## Plotagem do fator reordenado racionalmente:
plot(ordem)




