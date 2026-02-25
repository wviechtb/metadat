# Cuijpers, P., & Smit, F. (2002). Excess Mortality in Depression: 
# a Meta-Analysis of Community Studies. Journal of Affective Disorders, 
# 72(3), 227-236.

dat.cuijpers2002 <- read.table("data-raw/dat.cuijpers2002.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.cuijpers2002, file="data/dat.cuijpers2002.rda")

