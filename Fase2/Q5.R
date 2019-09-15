#***********#
# Questão 5 #
#***********#

# Q5.R #

#' Script para resolução questão 2 da segunda fase da
#' Liga Brasileira de Computação 2019
#'
#' @author
#' Alice Câmara, Igor Brandão, Lukas Iohan

# ---- IMPORT SECTION ----

# Import the necessary libraries

#*******************************************************************************************#

# ---- ITEM A, B, C, D, E ----

# Carrega o dataSet em um dataFrame
df <- as.data.frame(fread("./Q5/Q5a.out", header = F, stringsAsFactors = F))
df <- df[,c("V3", "V1")]
df = df[-1,]

# Remove os duplicados
df <- unique(df)

# Ordena os intervalor de acordo com o final
df <- df[order(df$V2), ]

# Novo data frame
result <- data.frame(query=NA,target=NA, stringsAsFactors = F)

# Ajusta o resultado para o padrão da submissão dos dados
for (i in seq(1:1048)) {
  sequencia <- paste0('sequence_', i)
  
  posic <- which(sequencia==df$V3)
  
  if (length(posic) != 0) {
    result[i,]$query <- sequencia
    result[i,]$target <- df[posic,]$V1
  } else {
    result[i,]$query <- sequencia
    result[i,]$target <- '-'
  }
}

write.table(result, file="./Q5/Q5a.txt", row.names=FALSE)
