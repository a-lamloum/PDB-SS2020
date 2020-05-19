###########################################
#  - Processing of Biological Data        # 
#  - Exercise Sheet 1                     #
#  - 2020- 05- 18                         #
#  - Ahmed Lamloum & Md Adnan karim       #
###########################################


# R version 3.6.1 (2019-07-05)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 10 x64 (build 18363)
# 
# Matrix products: default
# 
# locale:
# [1] LC_COLLATE=English_United States.1252  LC_CTYPE=English_United States.1252   
# [3] LC_MONETARY=English_United States.1252 LC_NUMERIC=C                          
# [5] LC_TIME=English_United States.1252    
# 
# attached base packages:
#   [1] stats     graphics  grDevices utils     datasets  methods   base     
# 
# loaded via a namespace (and not attached):
#   [1] compiler_3.6.1 tools_3.6.1   

# Pakages 
install.packages("VIM")
library("VIM")
library(readr)
library(ggplot2)

# Data Imputation
# Importing the data 
ms_toy <- read_delim("D:/Study/bioinformatics master/PBD/1_Assignment/supplement1/ms_toy.txt", 
                       +"\t", escape_double = FALSE, trim_ws = TRUE)
View(ms_toy)

# Imputation based on given data distribution
ms_toy_mean <- mean(ms_toy)
ms_toy_mean <- sapply(ms_toy, mean, na.rm = TRUE)
View(ms_toy_mean)

ms_toy_sd <- sapply(ms_toy, sd, na.rm = TRUE)
View(ms_toy_sd)
plot(ms_toy)
barplot(ms_toy)


# 2. k-Nearest Neighbor imputation 
# Create a dataset containing only the three control samples (ctr.1, ctrl.2, ctrl.3 ).
knn = ms_toy[,1:3]

# . Remove any row where all three samples have missing values (since there is no data to derive anything from).
knn1 <- knn[rowSums(is.na(knn)) != ncol(knn), ]
imp_knn <- kNN(knn1)



df_base <- ggplot(data = ms_toy_sd, aes(x=ctrl.1))
df_base + geom_bar(stat = "count")

barplot(ms_toy_sd)
