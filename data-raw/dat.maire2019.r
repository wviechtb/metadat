dat.maire2019.data <- read.table("data-raw/dat.maire2019.data.txt", header=TRUE, as.is=TRUE)
save(dat.maire2019.data, file="data/dat.maire2019.data.rda")

dat.maire2019.dmat <- read.table("data-raw/dat.maire2019.dmat.txt", header=TRUE, as.is=TRUE)
save(dat.maire2019.dmat, file="data/dat.maire2019.dmat.rda")
