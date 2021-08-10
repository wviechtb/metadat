# Kalaian, H. A., & Raudenbush, S. W. (1996). A multivariate mixed linear
# model for meta-analysis. Psychological Methods, 1(3), 227-235.

dat.kalaian1996 <- read.table("data-raw/dat.kalaian1996.txt", header=TRUE, stringsAsFactors=FALSE)
dat.kalaian1996 <- dat.kalaian1996[c(1:10,12,11)]
dat.kalaian1996$vi <- round(with(dat.kalaian1996, 1/n1i + 1/n2i + yi^2 / (2*(n1i+n2i))), 4)
save(dat.kalaian1996, file="data/dat.kalaian1996.rda")
