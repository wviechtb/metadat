dat.yusuf1985 <- read.table("data-raw/dat.yusuf1985.txt", header=TRUE, as.is=TRUE, colClasses=c(id="character"))
save(dat.yusuf1985, file="data/dat.yusuf1985.rda")
