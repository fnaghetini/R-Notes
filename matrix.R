###### MATRIZES NO R
# É bidimensional (linhas e colunas)

##### CRIAÇÃO DE MATRIZES

#### Criação de matrizes usando VETORES
produtos <- c("TV", "carro", "celular", "livro")
vendas <- c(12,3,50,20)

### O comando "cbind" transforma vetores em COLUNAS de uma matriz
# Forma mais aconselhada de formar uma matriz a partir de vetores
cbind (produtos,vendas)
# observe que só um tipo de variável é permitido. Os int viraram
# caracteres
# A ordem importa! O que vc coloca primeiro é a primeira coluna
cbind (vendas,produtos)
mes <- cbind (produtos,vendas)

### O comando "rbind" transforma vetores em LINHAS de uma matriz
rbind (vendas,produtos)
# observe que só um tipo de variável é permitido. Os int viraram
# caracteres
# A ordem importa! O que vc coloca primeiro é a primeira linha
rbind (produtos,vendas)



#### Criação de matrizes usando MATRIX
### Forma genérica -> matrix (elementos, nrow = i, ncol = j)
# nrow * ncol deve ser igual ao número de elementos
matrix (1:20,nrow=4,ncol=5)
matrix ("K",nrow=5,ncol=5)
matrix (0,nrow=5,ncol=5)
# Criar uma matriz de zeros e depois substituir os valores é muito usado!
# Observe que a matriz é preenchida por colunas


#### Criação de matrizes com preenchimaento por linhas
matrix (1:20,nrow=4,ncol=5,byrow=T)
matrix (1:25,nrow=5,ncol=5,byrow=T)

#### caso o número de elementos for menor que nrow*ncol, o R tenta alocar
# esses elementos
matrix (1:5,nrow=5,ncol=5)
matrix (1:5,nrow=5,ncol=5,byrow=T)





##### ACESSO DE MATRIZES
# Forma genérica -> matriz[i,j]

mes
# Mostra elemento de linha=2 e coluna=1
mes[2,1]
# Mostra linha 2
mes[2,]
# Mostra coluna 1
mes[,1]
# Mostra as linhas 2 até 4
mes[2:4,]
# Mostra apenas a primeira coluna das linhas 2 a 4
mes[2:4,1]
# Quantas unidades de celular foram vendidas?
mes[3,2]
# Qual produto vendeu 12 unidades?
mes[1,1]





##### MODIFICANDO MATRIZES E TRANSFORMAÇÃO DE TIPO DE VARIÁVEL
# As alterações em uma matriz são PERMANENTES

### ALTERAÇÃO DE UMA COLUNA DA MATRIZ

# Queremos obter uma nova matriz "mes_fev", em que o número de vendas é igual
# a "vendas_jan" + 2
mes_jan <- mes
vendas_fev <- mes_jan [,2]
vendas_fev <- vendas_fev + 2 # Não pode ser feito diretamente pois os valores
# estão sendo reconhecidos como caracteres
vendas_fev <- as.numeric (vendas_fev) # Tranformação para inteiros
vendas_fev <- vendas_fev + 2 # Em fev, vendemos 2 unidades mais de cada produto
mes_fev <- mes_jan # Chamei de mes_fev o clone da matriz mes_jan
mes_fev [,2] <- vendas_fev # Atualização do valor vendas para "vendas_fev"



### ALTERAÇÃO DE UM ELEMENTO DA MATRIZ

# Houve um erro de digitação. Em fev, foram vendidas 24 TVs
mes_fev[1,2] <- 24
# O certo é "televisor" e não "TV"
mes_fev[1,1] <- "televisor"



### ALTERAÇÃO DE UMA LINHA DA MATRIZ
# O nome certo é "telemóvel" e não "celular". Foram vendidas 60 unidades
mes_fev [3,] <- c("telemóvel", 60)



### ALTERAÇÃO DE UMA COLUNA DA MATRIZ
# Na verdade foram vendidas, respectivamente 60,40,50,87 unidades
mes_fev[,2] <- c(60,40,50,87)



### ALTERAÇÃO DE UM INTERVALO DA MATRIZ
# As vendas de carro, telemóvel e livro foram, na verdade, 55,85,45
mes_fev[2:4,2] <- c(55,85,45)



### ALTERAÇÃO DE CERTAS POSIÇÕES DA MATRIZ
# As vendas de televisor e livro foram, na verdade, 45 e 112
mes_fev[c(1,4),2] <- c(45,112)



### ALTERAÇÃO DE UM ELEMENTO QUE NÃO SE SABE O ÍNDICE
# Onde está escrito "televisor", na verdade é "TV"
match ("televisor", mes_fev) # Identificação do índice do valor
mes_fev [1,1] <- "TV"  # Substituição do valor



### EXCLUSÃO DE UMA LINHA DA MATRIZ
# A exclusão apenas OMITE a linha, ela é NÃO PERMANENTE
# Não foi vendido nenhum telemóvel em fev
mes_fev[-3,]
# Para atualizarmos de maneira permanente a matriz, criamos uma variável
mes_fev_drop <- mes_fev[-3,]



### EXCLUSÃO DE UMA COLUNA DA MATRIZ
# Quero sumir com a coluna de produtos
mes_fev[,-1]



### EXCLUSÃO DE LINHA + COLUNA DE MATRIZ
# Quero sumir com a coluna de produtos e com a linha de livro
mes_fev[-4,-1]






##### OPERAÇÕES COM MATRIZES

carlos <- c(100,230,400,340)
luiza <- c(300,234,500,650)
camila <- c(450,333,234,800)
vendas_func <- cbind (carlos,luiza,camila)


#### NÚMERO DE LINHAS E COLUNAS DE UMA MATRIZ
# Serve para dataframes e tables
dim(vendas_func) # Retorna um VETOR
## Acesso ao vetor retornado por "dim()":
# Quermos somente o número de colunas:
dim(vendas_func)[2]
# Queremos somente o número de linhas:
dim(vendas_func)[1]


#### NÚMERO DE LINHAS DE UMA MATRIZ
nrow(vendas_func)


#### NÚMERO DE COLUNAS DE UMA MATRIZ
ncol(vendas_func)


#### OBSERVAÇÃO
# dim(matriz)[1] == nrow(matriz)
# dim(matriz)[2] == ncol(matriz)


#### OPERAÇÕES ELEMENTARES COM MATRIZ

### SOMA/SUBSTRAÇÃO/DIVISÃO/PRODUTO/ELEVADO DE UMA MATRIZ A UMA CONSTANTE
# OBS.: Essas operações não ficam salvas! Deve-se atribuir uma nova variável
# à matriz que sofreu a operação

vendas_func + 2
# Adiciona-se o valor da cte a cada elemento da matriz
vendas_func - 2
# Subtrai-se o valor da cte a cada elemento da matriz
vendas_func * 0.7
# Multiplica-se o valor da cte a cada elemento da matriz
vendas_func / 2
# Divide-se o valor da cte a cada elemento da matriz
vendas_func ^ 2
# Eleva-se o valor da cte a cada elemento da matriz
sqrt(vendas_func)
# Tira a raíz de cada elemento da matriz
log (vendas_func)
# Tira o log natural/neperiano de cada elemento da matriz
vendas_func_70 <- vendas_func * 0.7
# Atribuição da matriz c/ operação a uma variável

## Quanto carlos vendeu?
sum (vendas_func[,1])
## Quanto Camila vendeu?
sum(vendas_func[,3])
## Quanto é o valor médio de vendas de Luíza?
mean(vendas_func[,2])
## Quanto é o valor médio de vendas de Camila?
mean (vendas_func[,3])
## Qual é a média geral de vendas?
mean(vendas_func)



#### OPERAÇÕES ENTRE MATRIZES
a <- matrix(1:20,nrow=4,ncol=5)
b <- matrix(5:24,nrow=4,ncol=5)

### SOMA E SUBTRAÇÃO ENTRE MATRIZES
a - b # subtração
b - a # subtração
a + b # adição

### PRODUTO DE ELEMENTOS DA MATRIZ
# OBS.:  NÃO É O produto matricial (linha * coluna...)!!!!
a * b

### PRODUTO MATRICIAL ENTRE MATRIZES
# OBS.: aí sim (linha * coluna...) -> a %*% b <-> ncol(a) == nrow(b)
# Se fizermos a %*% b, dará um problema. O número de colunas da primeira matriz
# deve ser igual ao número de linhas da segunda matriz
# Vou então retirar uma coluna de "a" para fazer esta operação
ncol(a[,-3]) == nrow(b) # Validando se ncol(a) == nrow(b)
a[,-3] %*% b # Produto matricial






##### CURIOSIDADES SOBRE MATRIZES


#### IMAGENS COMO MATRIZES
# Sabe-se que uma imagem é um conjunto de pixels. Essa imagem pode ser 
# representada por uma matriz, cujos elementos dessa matriz seriam o
# índice de cor de cada pixel da imagem

# Criação de uma matriz só com zeros. A imagem é toda igual
A <- matrix(0,nrow=10,ncol=5)
image(A)

# Criação de uma matriz com um range de valores. A imagem é diferente
B <- matrix(1:50,nrow=10,ncol=5)
image(B)

# Criação de um MDT de um vulcão
image (volcano)



#### CONTORNOS DE MATRIZES!!!!!!!!!!!!!!!!!!!!!!!
# Utilizado para topografia (curvas de nível), dados geoquímicos de solo, etc

### Contorno simples
C <- matrix (1:5,nrow=10,ncol=5)
contour (C)


### Contorno de números aleatórios
população <- 1:10000
amostra <- sample(população,100,replace=T)
matriz <- matrix(amostra, nrow=10,ncol=10)
contour(matriz)

### Contorno e imagem de um dataset interno do R (volcano)
volcano
contour(volcano)





#### Perspectiva de uma matriz
persp (volcano) # Vulcão em 3D
persp(matriz) # Números aleatórios em 3D
persp(B) # Rampa em 3D




#### RESOLUÇÃO DE SISTEMAS DE EQUAÇÃO COM "SOLVE()"

### EQUAÇÃO SIMPLES
# Imagine a seguinte equação:
# 2x = 8
# Podemos resolvê-la com o método "solve()"
# Primeiro parâmetro -> coeficiente da variável dependente
# Segundo argumento -> resultado
solve(2,8)


### SISTEMA DE EQUAÇÕES
# Resolve-se um sistema de eqs. pelo cálculo da matriz inversa

# Imagine o seguinte sistema de equações:
  # 2X1 + 3X2 - 4X3 + 8X4 = 20
  # 4X1 + 3X2 + 3X3 + 1X4 = 35
  # 3X1 - 1X2 - 2X3 + 1X4 = 40
  # 8X1 + 4X2 + 1X3 + 1X4 = 100

# Transformando cada equação em um vetor:
a <- c(2,3,-4,8,20)
b <- c(4,3,3,1,35)
c <- c(3,-1,-2,1,40)
d <- c(8,4,1,1,100)

# Transformando esses vetores em matriz (cada vetor vira uma LINHA):
sistema <- rbind (a,b,c,d)

# Solução do sistema de equações:
solve (sistema[,-5], sistema[,5])
  # Primeiro parâmetro -> todas as colunas  da matriz, exceto a última
  # Segundo parâmetro -> apenas a última coluna da matriz


### CÁLCULO DO DETERMINANTE DE UMA MATRIZ
# A matriz deve ser QUADRADA!
dim(sistema) # 4 linhas e 5 colunas
sistema_1 <- sistema[,-5] # Remoção da última coluna da matriz
det (sistema_1) # Determinante da matriz sem a 5ª coluna


### TRANSPOSIÇÃO DE UMA MATRIZ
# O que era linha vira coluna e vice-versa
t(sistema) # Transposição da matriz
dim (sistema) # 4 linhas / 5 colunas
dim(t(sistema)) # 5 linhas e 4 colunas






##### OUTRAS OBSERVAÇÕES:

#### Parâmetro "dimnames" no método "matrix()":
# O parâmetro "dimnames" retorna o nome das colunas. Deve ser uma LISTA!
cadastro <- matrix(c(NA, NA, NA, NA), nrow = 3, ncol = 4, 
            dimnames = list(NULL, c("Nome", "Idade", "Cidade", "Telefone")))


#### Método "colnames()"
# Esse método permite a alteração dos nomes das colunas/atributos de uma matriz
colnames (cadastro) <- c("NOMES","IDADE","CIDADE","CELULAR")






##### EXERCÍCIOS

#### EXERCÍCIO 1: Criar uma matriz 4x3 com os dados informados

### Primeira solução:
# Criação de um vetor único
vet <- c("Marcos de Aguiar",4000,44,
         "Paula Miranda",2500,56,
         "Emilio Santos",1200,76,
         "Pryscilla de Albuquerque",3400,40)
# Criação da matriz com os nomes dos atributos
emprestimo <- matrix (vet, nrow=4,ncol=3,byrow=T,
                      dimnames=list(NULL,c("NOME","SALÁRIO","IDADE")))


### Segunda solução
#Criação de um vetor por solicitante
vet1 <- c("Marcos de Aguiar",4000,44)
vet2 <- c("Paula Miranda",2500,56)
vet3 <- c("Emilio Santos",1200,76)
vet4 <- c("Pryscilla de Albuquerque",3400,40)
# Criação da matriz por LINHAS
rbind(vet1,vet2,vet3,vet4)
# Essa solução não é boa, pois não nomeia os atributos


### Terceira solução:
# Criação de vetores por atributo
nomes <- c("Marcos de Aguiar","Paula Miranda","Emilio Santos","Pryscilla de Albuquerque")
salario <- c(4000,2500,1200,3400)
idade <- c(44,56,76,40)
# Criação da matriz por COLUNAS
emprestimo <- cbind(nomes,salario,idade)
# Essa solução já é melhor que a segunda e semelhante à primeira




#### EXERCÍCIO 2: O salário de Paulo, na verdade é 5500.33 e não 2500
# Extraindo coluna de salários da matriz e transformando valores em inteiros
salarios_num <- as.numeric (emprestimo [,2])
# Alterando o valor no vetor
salarios_num[2] <- 5500.33
# Substituido a coluna "salário" da matriz pelo vetor numérico corrigido "salarios_num"
emprestimo[,2] <- salarios_num




#### EXERCÍCIO 3: A coluna salários é na verdade 30% menor
# Multiplicando o vetor já numérico por 0.7
salarios_liq <- salarios_num * 0.7
# Substituindo a coluna "salário" pelo vetor "salarios_liq"
emprestimo [,2] <- salarios_liq




#### EXERCÍCIO 4: Obter a média salárial dos salários líquidos
mean (salarios_liq)




#### EXERCÍCIO 5: Renomeie os campos de atributo. Todos devem começar com letras maiúsculas:
colnames(emprestimo) <- c("Nomes", "Salário", "Idade")














