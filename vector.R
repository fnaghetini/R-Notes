##### Criação de Vetores

#Vetores são a base do R. Com base neles, pode-se criar 
#os outros objetos
# Eles são 1D
# São mutáveis como as listas

# Operador de atribuição "<-"

# O "c" é utilizado toda vez que deseja-se atribuir mais de
# um item ao vetor

#### Tipos de vetores
### Vetor Numérico
vetor_1 <- c(1,2,3,4,5)
vetor_2 <- (5)

### Vetor de Caracteres
nomes <- c("Camila", "Franco", "Maria", "Marcos")
nome <- ("Camila")

#### Formas de criar um vetor
### Normal (poucos elementos)
numeros <- c(1,2,3,4,5,6)

### Método "scan ()" -> muitos elementos (tipo um "input")
# Para finalizar a lista de termos, basta não digitar nada
# e apertar "Enter" no Console
algarismos <- scan ()




##### Acessando Vetores
# Os índices no R começam no 1 e não no 0

#### Seleção de 1 elemento pelo índice
algarismos[1]
algarismos[3]

#### Seleção de 2 ou mais elementos pelos índices
# Deve-se colocar o operador de combinação "c"
algarismos [c(1,3,6)]

#### Seleção de um range/intervalo de índices
# Para intervalos não se utiliza o operador de combinação "c"
algarismos [1:6]




##### Modificação de Vetores

#### Alteração de um elemento do vetor
algarismos[4] <- 99
algarismos

#### Alteração de 2 ou mais elementos do vetor
algarismos [c(1,5,6)] <- c(4,5,6)
algarismos

#### Alteração de um intervalo de elementos do vetor
algarismos[1:4] <- c(1,2,3,4)
algarismos

#### Remoção de um elemento do vetor
# AS OPERAÇÕES DE REMOÇÃO NÃO REMOVEM DEFINITIVAMENTE (SÓ OMITEM)

# Para omitir definitivamente deve-se declarar novamente
# a variável

# Remoção do elemento de índice 4
algarismos[-4]
algarismos # O vetor não perdeu o elemento 4 definitivamente
algarismos <- algarismos[-4]
algarismos # O vetor perdeu o elemento 4 definitivamente

#### Remoção de mais de um elemento do vetor
algarismos [c(-3,-4,-5)]

#### Remoção de um intervalo de elementos do vetor
algarismos [-1:-4]


#### Adição de um elemento ao vetor
# As operações de adição são permanentes
algarismos # Tem 7 elementos
algarismos[8] <- 898
algarismos # Tem 8 elementos

#### Adição de um intervalo de elementos ao vetor
algarismos[9:12] <- c(55,66,77,88,99)
algarismos




##### Operações com Vetores

#### Comprimento de um vetor (número de elementos)
length (algarismos) # 12 elementos

#### Soma de uma constante a um vetor
# NÃO É UMA OPERAÇÃO DEFINITIVA
algarismos + 2 # Adiciona-se 2 a cada elemento do vetor

#### Multiplicação de uma constante a um vetor
# NÃO É UMA OPERAÇÃO DEFINITIVA
algarismos * 5

#### Divisão de uma constante a um vetor
# NÃO É UMA OPERAÇÃO DEFINITIVA
algarismos / 6 # Sempre retorna decimal

#### Resto inteiro da divisão de uma constante a um vetor
# NÃO É UMA OPERAÇÃO DEFINITIVA
algarismos %% 6

#### Divisão inteira de uma constante a um vetor
# NÃO É UMA OPERAÇÃO DEFINITIVA
algarismos %/% 6

#### Log natural de um vetor
# Tira-se o log de cada elemento do vetor
# NÃO É UMA OPERAÇÃO DEFINITIVA
log (algarismos)

#### Média de um vetor
mean(algarismos) # Retorna a média do vetor

#### Mediana de um vetor
median (algarismos) # Retorna a mediana do vetor

#### Tipo de info de um vetor
mode (algarismos)
mode (nome)
#OBS Não posso ter mais de um tipo de info diferente em um vetor
velotrol <- c(1,2,"carro",4) # Como existe um "character", todos
# os elementos foram transformados em character
mode(velotrol)

#### Máximo de um vetor
max(algarismos)

#### Mínimo de um vetor
min(algarismos)

#### Ordenação crescente de vetor
sort(algarismos)
sort (marcas1) # Ordenação crescente alfabética

#### Ordenação decrescente de vetor
sort (algarismos,decreasing = T)

#### IMPORTANTE!!!
# Se quisermos guardar essas infos, devemos declarar uma 
# variável com a operação

#### Soma de vetores
# OS VETORES DEVEM TER O MESMO NÚM. DE ELEMENTOS!!!
algarismos_2 <- algarismos * 2
algarismos - algarismos_2

#### Multiplicação de vetores
# OS VETORES DEVEM TER O MESMO NÚM. DE ELEMENTOS!!!
algarismos * algarismos_2

#### Divisão de vetores
# OS VETORES DEVEM TER O MESMO NÚM. DE ELEMENTOS!!!
algarismos_2 / algarismos




##### União, Interseção e Diferenças de Vetores

vend1 <- c("Adidas", "Nike", "Polo", "Mizuno")
vend2 <- c("Nike", "Osklen", "Polo", "New Balance")

#### União (probabilidade) de vetores
# A ordem dos termos não faz diferença
# Não gera elementos duplicados
union (vend1, vend2)

#### Interseção (probabilidade) de vetores
# A ordem dos termos não faz diferença
intersect (vend1, vend2)

#### Diferença (probabilidade) de vetores
# A ordem faz diferença!
setdiff (vend1, vend2)
setdiff (vend2, vend1)

marcas1 <- c("nike", "adidas", "mizuno")
marcas2 <- c("polo", "osklen", "CK")

#### Numéro de combinações possíveis entre elem. de vetores
interaction(marcas1, marcas2) # 9 possíveis combinações/interações
# OBS1.: não se diferencia combinações "nike.CK" e "CK.nike"
# OBS2.: não se realiza combinações entre elem. do mesmo vetor!
interaction (vend1, vend2) # 16 possíveis combinações
#
marcas3 <- c("adidas", "nike", "mizuno")
marcas4 <- c("adidas", "mizuno", "NB")
interaction(marcas3, marcas4) # 9 possíveis combinações/interações
# OBS.: para vetores com valores em comum (intersec. != 0) não muda muito




##### Vetores Lógicos (Booleanos)
# Temos valores com afirmações "F" ou "T"
# Normalmente são resultados de uma operação bool

#### Comparação de vetores com uma constante
produtos <- c("tv", "notebook", "celular")
qtde1 <- c(12,10,40)

qtde1 < 30 # Retorna um vetor booleano que verifica se essa operação é "T"
# ou "F" para cada elemento do vetor
qtde1 > 10 # Idem o raciocínio
qtde1 == 10 # Idem raciocínio
qtde1 != 10 # Idem raciocínio

#### Comparação entre dois vetores
marcas3 <- c("adidas", "nike", "mizuno")
marcas4 <- c("adidas", "mizuno", "NB")

marcas3 == marcas4 # Compara cada elemento de cada vetor para ver se são iguais
marcas1 != marcas3 # Compara cada elemento de cada vetor para ver se são iguais
marcas1 > marcas2 # Compara por ordem alfabética (olha a primeira letra)

num1 <- c(1,2,3,4,5)
num2 <- c(1,3,3,5,5)
num2 > num1

#### Comparação de um elem. de um vetor com uma constante
# Muito utilizada em laços
num1[1] == 1
num1[2] != 2
num1[3] < 2
marcas1 == "nike"
marcas3 != 'nike'

#### Soma de um vetor bool
# Útil na limpeza de dados (identificar presença de NAs)
# "T" = 1
# "F" = 0
sum (num2 > num1)
# Como o resultado foi 2, tivemos dois "T"
seq <- scan()
length (seq) # 44 termos
sum (seq == 1) # 20 valores iguais a 1 (retornaram "T")

#### Identificação do índice de determinado valor
nomes <- c("Franco", "Camila", "Maria", "Marcos", "Henrique", "Júlia", 
           "Natália", "Ricardo", "Charles", "Denilson", "Jonas", "Julião",
           "Golimar", "Josimar")
match ("Charles", nomes) # "Charles" está no índice 9

match (nomes, "Charles") # A ORDEM DOS TERMOS ALTERA O RESULTADO!!!




##### Exercícios sobre vetores

#### Exercício 1: Salvar nomes na variável "nomes"
nomes <- c("Marcos de Aguiar", "Paula Miranda", "Emilio Santos",
           "Priscila de Albuquerque")


#### Exercício 2: Corrigir elemento de índice == 4
nomes[4] <- "Pryscilla de Albuquerque"
nomes


#### Exercício 3: Salvar salários brutos na variável "salário"
salarios <- c(4000, 2500, 1200, 3400)
salarios

#### Exercício 4: Achar salário líquido (salario * 0.70)
salarios_liq <- salarios * 0.7



