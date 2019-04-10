dat.senn2013 <- read.table("data-raw/dat.senn2013.txt", header=TRUE, stringsAsFactors=FALSE, sep=",")
save(dat.senn2013, file="data/dat.senn2013.rda")
