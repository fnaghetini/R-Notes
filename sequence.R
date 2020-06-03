##### Sequências
# Utilizada na criação de funções
# è uma das bases do R




#### Criação de sequências por ELEMENTOS

### Geração de sequência de 1 a 20 (passo default = 1)
1:20
5:20
# Utilizado para consultar determinadas linhas no dataset


### Geração de sequência com comando seq ()

seq (5,30)
seq (10,40)
seq (-20,30)
# Primeiro parâmetro é o primeiro elemento da sequência
# Segundo parâmetro é o último elemento da sequência
# Por default, o passo é 1
seq(1,25,5)
seq(0,20,2)
seq(0,50,5)
seq(0,10,0.5)
# Terceiro parâmetro é o passo da sequência




#### Criação de sequências por REPETIÇÃO

### Repetição comum
rep (3,10)
rep ("K", 10)
rep (69, 20)
# Primeiro parâmetro -> número/caracter que será repetido
# Segundo parâmetro -> número de repetições do número/caracter

### Repetição de um intervalo
rep (1:5,10)
# Repete 1,2,3,4,5 por 10 vezes

### Repetição de vetor
nomes <- c("Franco","Camila","Maria","Carlindo")
rep(nomes,5)

### Repetição do vetor com "each"
rep(nomes,times=4,each=3)
# O parâmetro "times" não precisa ser digitado, pois o R entende
# que o segundo elemento do comando "rep" é o "times"
# O parâmetro "each" considera quantas vezes consecutivas será
# repetido o mesmo elemento




#### Criação de sequências por AMOSTRAS ALEATÓRIAS
# Utiliza-se amostras aleatórias

### Método "sample" comum
sample(1:30,10)
# Primeiro parâmetro -> intervalo que compreende a população
# Segundo parametro -> número de amostras aleatórias que serão
# selecionadas
# Se eu rodar diversas vezes, cada hora gerará uma amostra distinta
# PROBLEMA -> no processo de amostragem aleatória, pode pegar mais 
# de um elemento igual. Isso pode não ser interessante...

### Método "sample" com parâmetro "replace"
sample(1:15,10,replace=T)
# Esse argumento permite a seleção de amostras duplicadas
# Esse método é chamado de "AMOSTRAGEM COM REPOSIÇÃO"




#### Acessando e modificando e operações com sequências
# Funciona do mesmo jeito dos vetores
sequencia <- 1:100
sequencia [10:20]
bool <- (sequencia > 50)
sum (bool) # 50 valores são maior que 50 na nossa sequência
sequencia[50] <- 100000
sequencia[-50]


#### Questão 1: Selecionar 5 amostras aleatórias em uma sequência de 30 amostras
pagadores <- 1:30
sample(pagadores,5,replace=F)
# OBS.: não precisa colocar o "replace=F", pois isso já é default.
# Isso só foi feito, para deixar claro que não pode-se ter unidades
# amostrais repetidas durante a amostragem aleatória
