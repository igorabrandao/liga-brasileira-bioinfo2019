#***********#
# Questão 1 #
#***********#

# Q1.R #

#' Script para resolução questão 1 da segunda fase da
#' Liga Brasileira de Computação 2019
#'
#' @author
#' Alice Câmara, Igor Brandão, Lukas Iohan

# ---- IMPORT SECTION ----

# Import the necessary libraries
library(igraph)

#*******************************************************************************************#

# ---- ITEM A ----

# Importa o dataSet para variável local
dataSet <- read.table(file = './Q1/network_unw.tsv', sep = '\t', header = TRUE)

# Converte os dados csv para um objeto igraph
graph <- graph.data.frame(dataSet)

# Calcula o caminho mais curto entre 2 vértices
shortestPath <- get.shortest.paths(graph, from=V(graph)[name==0], to=V(graph)[name==500])

# Imprime o caminho mais curto de 0 a 500
print(shortestPath[1])

# Resposta
# 0 15 3 500

#*******************************************************************************************#

# ---- ITEM B ----

# Resposta
# 0 16 6 9 500

#*******************************************************************************************#

# ---- ITEM C ----

# Importa o dataSet para variável local
dataSet <- read.table(file = './Q1/network_3.tsv', sep = '\t', header = TRUE)

# Converte os dados csv para um objeto igraph
graph <- graph.data.frame(dataSet)

# Calcula o caminho mais curto entre 2 vértices

# Primeira parte do caminho
shortestPath <- get.shortest.paths(graph, from=V(graph)[name==411], to=V(graph)[name==699],
                                   weights=E(graph)$X22, mode='all')$vpath

# Segunda parte do caminho
shortestPath2 <- get.shortest.paths(graph, from=V(graph)[name==699], to=V(graph)[name==698],
                                   weights=E(graph)$X22, mode='all')$vpath

# Terceira parte do caminho
shortestPath3 <- get.shortest.paths(graph, from=V(graph)[name==698], to=V(graph)[name==411],
                                    weights=E(graph)$X22, mode='all')$vpath

print(shortestPath)
print(shortestPath2)
print(shortestPath3)

# Resposta
# 411 2 5 70 699 70 5 2 246 698 246 2 411

#*******************************************************************************************#

# ---- ITEM D ----

# Importa o dataSet para variável local
dataSet <- read.table(file = './Q1/network_3_no_rep.tsv', sep = '\t', header = TRUE)

# Converte os dados csv para um objeto igraph
graph <- graph.data.frame(dataSet)

# Calcula o caminho mais curto entre 2 vértices

# Primeira parte do caminho (OK)
shortestPath <- get.shortest.paths(graph, from=V(graph)[name==699], to=V(graph)[name==698],
                                   weights=E(graph)$X22, mode='all')$vpath

# Segunda parte do caminho (OK)
shortestPath2 <- get.shortest.paths(graph, from=V(graph)[name==698], to=V(graph)[name==697],
                                    weights=E(graph)$X22, mode='all')$vpath

# Terceira parte do caminho (aqui repete :X o 17)
shortestPath3 <- get.shortest.paths(graph, from=V(graph)[name==697], to=V(graph)[name==699],
                                    mode='all')$vpath

get.shortest.paths(graph, from=V(graph)[name==697], to=V(graph)[name==699], mode='all')

print(shortestPath)
print(shortestPath2)
print(shortestPath3)

# Resposta
# 699 3 617 698 269 8 17 697 17 699
