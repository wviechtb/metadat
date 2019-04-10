dat.riley2003 <- read.table("data-raw/dat.riley2003.txt", header=TRUE, stringsAsFactors=FALSE)
attr(dat.riley2003, "digits") <- 2
attr(dat.riley2003, "yi.names") <- "yi"
attr(dat.riley2003$yi, "measure") <- "GEN"
class(dat.riley2003) <- c("escalc", "data.frame")
save(dat.riley2003, file="data/dat.riley2003.rda")
