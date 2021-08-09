# Senn, S., Gavini, F., Magrez, D., & Scheen, A. (2013). Issues in performing
# a network meta-analysis. Statistical Methods in Medical Research, 22(2),
# 169-189.

dat.senn2013 <- read.table("data-raw/dat.senn2013.txt", header=TRUE, stringsAsFactors=FALSE, sep=",")
save(dat.senn2013, file="data/dat.senn2013.rda")
