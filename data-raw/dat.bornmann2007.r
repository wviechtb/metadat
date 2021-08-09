# Bornmann, L., Mutz, R., & Daniel, H. (2007). Gender differences in grant
# peer review: A meta-analysis. Journal of Informetrics, 1(3), 226-238.

dat.bornmann2007 <- read.table("data-raw/dat.bornmann2007.txt", header=TRUE, stringsAsFactors=FALSE, sep="\t")
save(dat.bornmann2007, file="data/dat.bornmann2007.rda")
