####### ARRAYS
# Com base nos arrays, é possível combinar diversas tabelas
# Se os vetores têm 1D e matrizes tem 2D, os arrays têm 3D
# Imagine que vc tenha diversas planilhas de faturamento da empresa.
# Uma solução é utilizar arrays para guardar todas essas tabela em um só objeto.
# Estrutura genérica:
    ## array (elementos,dim,dimnames=list())
      # elementos -> define-se se utilizaremos matrizes ou vetores para criar arrays
      # dim -> entram três argumentos (quantidade de linhas em cada matriz,
        # quantidade de colunas em cada matriz e quantidade de matrizes)
      # dimnames -> entram 3 argumentos (nomes das linhas, nomes das colunas, nomes das matrizes)


##### CRIAÇÃO DE ARRAYS

#### CRIAÇÃO DE ARRAYS COM MATRIZES

# Primeiro cria-se uma matriz 4x5:
A <- matrix (1:20,4,5)
# Criamos agora o array. Esse array conterá apenas uma matriz, por enquanto e não
# terá o parâmetro de nomes das dimensões:
array (A,dim=c(4,5,1))

# Podemos criar um array com duas matrizes iguais:
array(A, dim=c(4,5,2))
# OBS.: sabemos que é um array, pois no output aparece " , , 2"

# Podemos sumir com o terceiro argumento do parâmetro "dim", ou seja, o número
# de matrizes. O resultado é a criação de uma matriz:
array (A,dim=c(4,5))
# OBS.: observe que, no output, não apareceu " , , "
# Nesse caso: "A <- matrix(1:20,4,5) == array(A,dim=c(4,5))"
A == array(A,dim=c(4,5))

# Podemos criar arrays de matrizes com apenas um único elemento:
array(0,dim=c(6,5,3))
# OBS.: 3 matrizes foram criadas dentro de um mesmo array. Todos os elementos de todas as matrizes são 0.

# Podemos criar um array com caracteres:
array(c("TV", "celular", "mesa", "cadeira"), dim=c(5,4,3))





#### CRIAÇÃO DE ARRAYS COM VETORES

# Inicialmente, criamos dois vetores:
vendas <- c(10,15,20,45)
produtos <- c("TV","geladeira","notebook","carro")

## Podemos então criar um array com esses vetores. Como temos 2 atributos, o número de colunas deve
# ser igual a 2. Como temos 4 elementos, o número de linhas deve ser igual a 4. Por fim, queremos 
# criar 2 matrizes, pq sim:
array(c(vendas,produtos),dim=c(4,2,2))
## OBS.: a ordem dos elementos da combinação importa! Se eu inverter "vendas" por "produtos",
# "produtos" será a primeira coluna e "vendas" será a segunda
array(c(produtos,vendas),dim=c(4,2,2))

## Podemos atribuir nomes às linhas e colunas de cada matriz, bem como atribuir nomes a cada matriz.
# O parâmetro "dimnames" deve ser uma LISTA!!!
nomes_colunas <- c("Produtos","Quantidade") # nomes recebidos por atributos
nomes_matrizes <- c("Janeiro","Fevereiro","Março") # nomes de cada matriz
nomes_linhas <- c("Camila","Marcos","Maria","Franco")

total <- array(c(produtos,vendas),dim=c(4,2,3),dimnames=list(nomes_linhas,
                                                             nomes_colunas,nomes_matrizes))







##### ACESSO A ELEMENTOS DE ARRAYS

## Forma geral de acesso a arrays:
        # var_array[linha,coluna,matriz]

## Utilizaremos o último array criado:
total

## Podemos verificar as dimensões desse array:
dim(total) # 4 linhas, 2 colunas e 3 matrizes


#### ACESSANDO MATRIZES DE ARRAYS

## Queremos acessar a matriz referente ao mês de Fevereiro:
total[,,2] # vendas fevereiro

## Queremos acessar a matriz referente ao mês de Março:
total[,,3] # vendas março


#### ACESSANDO COLUNAS/VARIÁVEIS DE ARRAYS

## Queremos acessar apenas a coluna de produtos:
total[,1,] # Retorna todas as linhas de todas as matrizes da coluna de "produtos"

## Queremos acessar apenas a coluna de quantidade:
total[,2,]


#### ACESSANDO LINHAS DE ARRAYS

## Queremos acessar as vendas de Camila (linha 1)
total[1,,]

## Queremos acessar as vendas de Maria (linha 3)
total[3,,]

## Queremos acessar as vendas de Marcos (linha 2)
total[2,,]


#### ACESSANDO ARRAYS: COMBINAÇÃO DE MATRIZES, COLUNAS E LINHAS

## Queremos acessar a quantidade vendida (coluna 2) do mês de março (matriz 3)
total[,2,3]

## Queremos acessar os produtos vendidos (coluna 1) no mês de fevereiro (matriz 2)
total[,1,2]

## Queremos acessar os produtos vendidos (coluna 1) pela vendedora Camila (linha 1)
total[1,1,]

## Queremos acessar as quantidades vendidas (coluna 2) pelo vendedor Franco (linha 4)
total[4,2,]

## Queremos acessar o produto vendido (coluna 1) pela vendedora Maria (linha 3), no mês de março (matriz 3)
total[3,1,3]

## Queremos saber as quantidades e produtos vendidos por Marcos (linha 2) no mês de fevereiro (matriz 2)
total[2,,2]








##### MODIFICAÇÃO DE ELEMENTOS DE ARRAYS

#### MODIFICAÇÃO DE UM ELEMENTO DE UM ARRAY

## Suponha que, na verdade, a vendedora Camila (linha 1) vendeu uma quantidade de 69 TVs (coluna 1)
# no mês de fevereiro (matriz 2)
total[1,2,2] <- 69


#### MODIFICAÇÃO DE UMA LINHA DE UM ARRAY

## Suponha que Marcos (linha 2) vendeu em março (matriz 3), na verdade, 32 copos
total[2,,3] <- c("copos",32)


#### MODIFICAÇÃO DE UM INTERVALO DE UM ARRAY

## Suponha que queremos modificar as quantidades vendidas (coluna 2) de Maria e Franco (linhas 3 e 4)
# no mês de janeiro (matriz 1)
total[3:4,2,1] <- c(66,88)


#### MODIFICAÇÃO DE ALGUMAS LINHAS NÃO ADJACENTES DE UM ARRAY

## Suponha que, na verdade, Camila, Maria e Franco (linhas 1,3 e 4) venderam uma quantidade (coluna 2) 
# igual a 30, 45 e 59 no mês de março (matriz 3)
total[c(1,3,4),2,3] <- c(30,45,59)








##### NOMEAÇÃO E OPERAÇÕES COM ARRAYS

## Para essa seção utilizaremos um contexto mais voltado à geologia
## Primeiro criamos dois vetores que serão os atributos das matrizes
au <- 1:10
cu <- 3:12
## Daremos nomes a às dimensões do array:
linhas <- c("amostra 1", "amostra 2", "amostra 3", "amostra 4", 
            "amostra 5", "amostra 6", "amostra 7", "amostra 8", 
            "amostra 9", "amostra 10")
colunas <- c("Au", "Cu")
matrizes <- c("Campanha 1", "Campanha 2", "Campanha 3")
## Criaremos o array "teores":
teores <- array(c(au,cu),dim=c(10,2,3),dimnames = list(linhas, colunas,matrizes))
## Para todas as matrizes não ficarem iguais, alteraremos os valores de
# "Au" e "Cu" para as Campanhas 2 e 3:
teores[,c(1,2),2] <- c(0:9,20:29) # Mudança da Campanha 2
teores[,c(1,2),3] <- c(5:14,15:24) # Mudança da Camapnha 3

## Podemos filtrar apenas os teores de Cu (coluna 2) de todas as campanhas e
# de todas as amostras. Teremos então uma submatriz cujas linhas são as amostras
# e as colunas são, agora, as campanhas
teores[,2,]

## Podemos calcular a soma de todos os teores de Cu:
# Suponhemos que os teores sejam caracteres. Inicialmente devemos transformá-los
# em inteiros
as.numeric (teores[,2,])
## Podemmos agora somá-los:
sum(teores[,2,])

## Podemos ainda, calcular a média dos teores de Au:
mean(teores[,1,])

## Podemos calcular a mediana dos teores de Cu:
median(teores[,2,])

## Qual foi o maior teor de Au (coluna 1) obtido na Campanha 3 (matriz 3):
max(teores[,1,3])

## Qual foi o menor teor de Cu (coluna 2) obtido na Campanha 2 (matriz 2):
min(teores[,2,2])

#### OPERAÇÕES BOOLEANAS COM ARRAYS

## Retorna TRUE para valores iguais a 9 do array:
teores == 9

## Retorna TRUE para valores > 10 do array:
teores > 10








##### DICAS SOBRE ARRAYS

## Vamos criar 4 vetores iniciais:
vendas_sem_1 <- c(12,34,9)
vendas_sem_2 <- vendas_sem_1 * 2
vendas_sem_3 <- vendas_sem_1 * 4
vendas_sem_4 <- vendas_sem_2 + 14

## Vamos criar nomes para as dimensões desse array:
linha_ <- c("Camila","Franco","Maria")
coluna_ <- c("Semana 1","Semana 2", "Semana 3","Semana 4")
matriz_ <- c("Janeiro","Fevereiro","Março")

## Criando o array:
vendas_totais <- array(c(vendas_sem_1,vendas_sem_2,vendas_sem_3, vendas_sem_4),
                         dim=c(3,4,3),dimnames= list(linha_,coluna_,matriz_))


#### OPERAÇÕES COM "APPLY":
## Essa função calcula alguma operação predefinida para arrays:
## Forma genérica:
        # apply (X,MARGIN,FUNC)
          # X -> é o array
          # MARGIN -> 1=linha e 2=coluna
          # FUNC -> sum, median,mean,log,sqrt,etc...

### SOMA DE ELEMENTOS POR ATRIBUTO/COLUNA DE UM ARRAY:
## Quero somar todas as vendas de todos os meses para cada semana (coluna):
apply(vendas_totais,2,sum)


### MÉDIA DE ELEMENTOS POR LINHA DE UM ARRAY:
## Quero calcular a média de vendas por vendedor (linhas) para todos os meses:
apply(vendas_totais,1,mean)








##### EXERCÍCIOS SOBRE ARRAYS:
## Considerar que:
# Cada funcionário tem uma meta de 4 atendimentos por dia
# Cada cliente atendido deverá informar Nome,
# Salário, Idade, Motivo do Empréstimo,Valor Solicitado.


#### QUESTÃO 1 e 2: Construir um array com 3 MATRIZES contendo apenas zeros. 
# Cada matriz deve ter 4 LINHAS e 5 COLUNAS. Renomeie as dimensões da matriz

coluna <- c("Nome","Salário","Idade","Motivo Empréstimo","Valor Solicitado")
linha <- c("Cliente 1","Cliente 2","Cliente 3","Cliente 4")
matriz <- c("Melissa M","Carlos P","Luciana T")
planilhas <- array(0,dim=c(4,5,3),dimnames=list(linha,coluna,matriz))




#### QUESTÃO 3: Preencher arrays com as infos a seguir:

funcionario1 <- cbind(Nome=c("Marcos","Paulo","João","Kamila"),
                    Salario=c(4000,3000,4500,2300),
                    Idade=c(45,33,36,45),
                    Motivo=c("Compra de Carro","Reforma da Casa","Viagem","Compra de Casa"),
                    Valor.Pedido=c(45000,34000,20000,120000))

funcionario2 <- cbind(Nome=c("Marcela","Fábio","Luana","Romero"),
                    Salario=c(3200,4500,2500,1300),
                    Idade=c(34,30,56,54),
                    Motivo=c("Compra de Carro","Viagem","Viagem","Compra de Carro"),
                    Valor.Pedido=c(75000,55000,19000,90000))

funcionario3 <- cbind(Nome=c("Gustavo","Bruno","Joana","Vânia"),
                    Salario=c(11000,5600,1580,6300),
                    Idade=c(56,29,44,57),
                    Motivo=c("Compra de Casa","Viagem","Compra de Apartamento","Reforma da Casa"),
                    Valor.Pedido=c(55000,8000,21000,7000))

planilhas[,,1] <- funcionario1
planilhas[,,2] <- funcionario2
planilhas[,,3] <- funcionario3




#### QUESTÃO 4: Qual vendedor concederá mais crédito?

# Criando vetores para a nova matriz apenas com a 5 coluna de cada matriz:
vetor_1 <- as.numeric(planilhas[,5,1])
vetor_2 <- as.numeric(planilhas[,5,2])
vetor_3 <- as.numeric(planilhas[,5,3])
# Somando os créditos por vendedor:
sum(vetor_1)
sum(vetor_2) # Esse vendedor (Carlos P) concederá mais crédito
sum(vetor_3)






