dat.begg1989 <- read.table("data-raw/dat.begg1989.txt", header=TRUE, stringsAsFactors=FALSE)
attr(dat.begg1989, "digits") <- 4
attr(dat.begg1989, "yi.names") <- "yi"
attr(dat.begg1989, "vi.names") <- "vi"
attr(dat.begg1989$yi, "measure") <- "PR"
class(dat.begg1989) <- c("escalc", "data.frame")
save(dat.begg1989, file="data/dat.begg1989.rda")
