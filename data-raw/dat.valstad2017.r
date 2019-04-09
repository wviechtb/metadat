dat.valstad2017 <- read.csv("data-raw/dat.valstad2017.csv", header=TRUE, stringsAsFactors=FALSE)

dat.valstad2017$id <- dat.valstad2017$X
dat.valstad2017$X <- NULL
dat.valstad2017$es.id <- NULL

dat.valstad2017 <- dat.valstad2017[,c(12, 1:11)]

save(dat.valstad2017, file="data/dat.valstad2017.rda", ascii=FALSE)
