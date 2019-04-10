dat.nielweise2007 <- read.table("data-raw/dat.nielweise2007.txt", header=TRUE, stringsAsFactors=FALSE)
dat.nielweise2007 <- dat.nielweise2007[,c(1,2,3,6,7,4,5)]
save(dat.nielweise2007, file="data/dat.nielweise2007.rda")
