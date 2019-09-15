#***********#
# Questão 2 #
#***********#

# Q2.R #

#' Script para resolução questão 2 da segunda fase da
#' Liga Brasileira de Computação 2019
#'
#' @author
#' Alice Câmara, Igor Brandão, Lukas Iohan

# ---- IMPORT SECTION ----

# Import the necessary libraries
library(data.table)

#*******************************************************************************************#

# ---- ITEM A, B, C, D, E ----

# Carrega o dataSet em um dataFrame
df <- as.data.frame(fread("./Q2/file5_p2.in", header = F, stringsAsFactors = F))
colnames(df) <- c("V1", "V2")

# Ordena os intervalor de acordo com o final
df <- df[order(df$V2), ]

maxDisjointIntervals <- function(df) {
  colnames(df) <- c("V1", "V2")
  df <- df[order(df$V2), ]
  idx <- 1
  r1 <- df[idx, 2]
  for (i in 2:nrow(df)) {
    l1 <- df[i, 1]
    r2 <- df[i, 2]
    if (l1 > r1) {
      idx <- c(idx, i)
      r1 <- r2
    }
  }
  return(idx)
}

#check <- df[res, ]
#rownames(check) <- NULL

res <- maxDisjointIntervals(df)
res <- df[res, ]

write.table(res, file="./Q2/Q2e.txt", row.names=FALSE)
