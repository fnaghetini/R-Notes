######## DATAFRAMES NO R

## É o objeto alvo no R (e no Python). Com ele é possível fazer análises estatísticas,
# gráficos, tabelas. Tudo que vimos antes serve para entendermos os dataframes.

## O dataframe é uma matriz (tem linhas e colunas). É tipo uma planilha do excel. As
# LINHAS seriam os CASOS e as colunas seriam as VARIÁVEIS.



###### CRIAÇÃO DE DATAFRAMES

##### CRIAÇÃO DE DATAFRAMES INDIRETA (VETORES -> MATRIZ -> DATAFRAME)

## Primeiro criamos vetores, depois tranformamo-los em matriz e, por fim, a 
# transformamos em um dataframe

## Essa é a melhor forma de criar dataframes

## Criando vetores:
x <- c(1,2,3,4,5,6,7)
y <- c(2,4,5,6,7,8,9)
au <- c(0.5,0.9,1,2,3,0.6,0.1)
cu <- c(1,6,10,9,8,5,3)

## Criando matriz com os vetores acima:
matriz <- cbind(x,y,au,cu)

## Criando dataframe a partir da matriz acima:
df_au_cu <- as.data.frame(matriz)
# Observe que a visualização de um dataframe é muito mais "limpa" que a de uma
# matriz





##### CRIAÇÃO DE DATAFRAMES DIRETA - DATA.FRAME()

## Criando de forma direta um dataframe
df_pb_zn <- data.frame(x=1:7,
                       y=3:9,
                       pb=c(1,3,4,5,10,12,2),
                       zn=c(3,4,5,8,14,15,1))

## A dificuldade desse método é quando tem que milhares de linhas e colunas

## Uma variação desse método de criação é igualar as variáveis a vetores existentes:
df_ni_co <- data.frame(x=x,y=y,ni=au,co=cu)
# Nesse caso, utilizei os vetores que já existiam do primeiro método de criação







###### ACESSO A DATAFRAMES

## O processo de acesso a elementos do dataframe é similar ao de acessar uma matriz
# e uma lista


##### ACESSANDO LINHAS DE UM DATAFRAME

## Quero apenas a segunda amostra (linha) do "df_au_cu"
df_au_cu[2,]

## Quero apenas a segunda e a quarta amostra do "df_au_cu"
df_au_cu[c(2,4),]

## Quero da 2 a 6 amostras  do "df_au_cu"
df_au_cu[2:6,]



##### ACESSANDO COLUNAS DE UM DATAFRAME

## Quero apenas os teores de Au do dataframe
df_au_cu[,3]

## Outra forma de filtrar apenas os teores de Au seria:
df_au_cu$au

## Quero apenas as variáveis de teor do dataframe
df_au_cu[,3:4]

## Quero apenas a variável X e a variável Au do dataframe:
df_au_cu[,c(1,3)]



##### ACESSANDO ELEMENTOS ESPECÍFICOS DE UM DATAFRAME

## Quero apenas o valor de Au para a 5 amostra:
df_au_cu[5,3]

## Quero apenas o valor de Cu para a amostra 2:
df_au_cu[2,4]



##### ACESSANDO ELEMENTOS DE UMA VARIÁVEL CONTIDA EM UM DATAFRAME

## Quero acessar o teor de Au da amostra 5:
df_au_cu$au[5]

## Quero acessar o teor de Cu da amostra 3:
df_au_cu$cu[3]







###### MODIFICAÇÃO DE DATAFRAMES

##### DIFERANÇA ENTRE MÉTODOS DE CRIAÇÃO DE DATAFRAME

## Vamos criar alguns vetores:
x <- c(1,2,3,4,5,6,7)
y <- c(2,4,5,6,7,8,9)
au <- c(0.5,0.9,1,2,3,0.6,0.1)
cu <- c(1,6,10,9,8,5,3)
litologia <- c("Gabro","Gabro","Basalto","Xisto","Basalto","Filito","Xisto")

## Criamos um dataframe:
dados <- data.frame(x,y,au,cu,litologia)

## Vamos olhar a estrutura do dataframe criado:
str(dados)

## OBS.: veja que a vantagem do método "data.frame()" é que ele converte as
# variáveis categóricas em FATORES, o que é ótimo!

## Por exemplo, vamos criar o dataframe agora de maneira indireta.
dados_test <- cbind(x,y,au,cu,litologia)
dados_temp <- as.data.frame (dados_test)
str(dados_temp) # note que todas as variáveis foram convertidas em fatores, mesmo
# aquelas que são numéricas. Isso não é interessante. Se quiséssemos fazer
# operações com dataframes, por exemplo, não seria possível, pois todas as
# variáveis são fatores.




##### CONVERTENDO FATORES EM TIPOS NUMÉRICOS

## Essa conversão é feita em duas etapas: factor -> character -> numeric
dados_temp$au <- as.numeric(as.character(dados_temp$au))

## Observe que a variável Au agora é do tipo numérica
str(dados_temp)

## Se fizermos a transformação direta "factor -> numeric", ele irá rankear os
# valores.

## Caso eu criar o dataframe pelo método indireto, terei que executar essa rotina
# para cada variável numérica que eu tiver no dataframe. Por isso, melhor criar 
# pelo método "data.frame()".

##### MODIFICANDO ELEMENTOS DE UM DATAFRAME

## Podemos modificar elementos de uma variável do dataframe:
dados$au[2] <- 0.88
dados$cu[5] <- 20
dados$cu[2:5] <- c(5,8,12,25)
dados$au[c(1,4,7)] <- c(0.77,0.99,0.87)





##### ADIÇÃO DE VARIÁVEIS(COLUNAS) AO DATAFRAME

## Vamos adicionar a variável Pb ao dataframe:
dados$pb <- c(2,5,3,6,9,12,7)

## Vamos adicionar a variável zona ao dataframe:
zona <- c(0,1,0,0,1,1,0)
dados[,7] <- zona
# Por esse método, não é possível nomear a nova variável





##### EXCLUSÃO DE VARIÁVEIS(COLUNAS) DE UM DATAFRAME

## Vamos apagar a variável "V7":
dados <- dados[,-7]

## Vamos apagar duas variáveis:
dados <- dados[,-c(5,6)]
# Isso poderia ter sido feito com: dados[,-(5:6)]

## Note que igual a todos os outros objetos, para salvar uma exclusão no dataframe,
# devemos atualizar a variável





##### ADIÇÃO DE CASOS(LINHAS) AO DATAFRAME

## Queremos adicionar uma nova amostra(linha) ao nosso dataframe:
dados[8,] <- c(10,13,1.12,20)




##### REMOÇÃO DE CASOS(LINHAS) DO DATAFRAME

## Queremos remover a última linha do dataframe (linha 8):
dados <- dados[-8,]

## Quero remover as linhas 1 e 5 do dataframe:
dados <- dados[-c(1,5),]








###### OPERAÇÕES COM DATAFRAMES

##### NÚMERO DE LINHAS/COLUNAS DE UM DATAFRAME
nrow(dados)
ncol(dados)


##### DIMENSÃO DE UM DATAFRAME
dim(dados)
## "dim()" retorna um vetor de dois elementos (uma "tupla" no python). Podemos
# acessar apenas um dos valores desse vetor:
dim(dados)[1] # Retorna linhas
dim(dados)[2] # Retorna colunas
## Então:
nrow(dados) == dim(dados)[1]
ncol(dados) == dim(dados)[2]


##### COMPRIMENTO DE UMA VARIÁVEL DE UM DATAFRAME
## Só serve para VETORES e FATORES. Não serve para dataframes.
## Comprimento da variável "Au":
length(dados$au)


##### CONSULTANDO E ATRIBUINDO NOMES ÀS VARIÁVEIS DE UM DATAFRAME - NAMES()
## Quais são os nomes das variáveis do meu dataframe:
names(dados)
## Quero alterar os nomes das variáveis:
names(dados) <- c("X","Y","Au","Cu")


##### VISUALIZAÇÃO DE UM DATAFRAME COMO UMA PLANILHA DO EXCEL - VIEW()
## Muito usada para visualizar o dataframe de forma mais amigável
View(dados) # Note que essa função é capitalizada (primeira letra maiúscula)!


##### SUMÁRIO ESTATÍSTICO DE DATAFRAMES
## Calcula MIN,Q1,MEDIAN,MEAN,Q3 e MAX
summary(dados)
## Se as variáveis forem caracteres, ele retorna apenas o comprimento e o modo
## Se tivesse em caracter, devo tranformar para numérico para depois tirar o
# sumário


##### MEDIA, MEDIANA E DP DE VARIÁVEIS DE DATAFRAMES
## Média do Au:
mean(dados$Au)
## Mediana do Cu:
median(dados$Cu)
## DP do Au:
sd(dados$Au)
## Variância do Cu:
var(dados$Cu)








###### ALGUNS GRÁFICOS

##### GRÁFICO DE BARRAS
barplot(dados$Au)

##### GRÁFICO DE PIZZA
pie(dados$Cu) # Não faz sentido, mas é assim que se faz

##### HISTOGRAMA
hist(dados$Au)

##### Q-Q PLOT
qqplot(dados$Au,dados$Cu)

##### SCATTERPLOT
plot(dados$Au,dados$Cu)


















