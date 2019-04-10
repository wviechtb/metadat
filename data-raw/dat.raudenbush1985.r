dat.raudenbush1985 <- read.table("data-raw/dat.raudenbush1985.txt", header=TRUE, stringsAsFactors=FALSE)
dat.raudenbush1985$sei <- NULL
attr(dat.raudenbush1985, "digits") <- 4
attr(dat.raudenbush1985, "yi.names") <- "yi"
attr(dat.raudenbush1985, "vi.names") <- "vi"
attr(dat.raudenbush1985$yi, "measure") <- "SMD"
attr(dat.raudenbush1985$yi, "ni") <- dat.raudenbush1985$n1i + dat.raudenbush1985$n2i
class(dat.raudenbush1985) <- c("escalc", "data.frame")
save(dat.raudenbush1985, file="data/dat.raudenbush1985.rda")
