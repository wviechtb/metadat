dat.konstantopoulos2011 <- read.table("data-raw/dat.konstantopoulos2011.txt", header=TRUE, stringsAsFactors=FALSE)
#dat.konstantopoulos2011 <- dat.konstantopoulos2011[,c(1,2,5,3,4)]
dat.konstantopoulos2011 <- cbind(dat.konstantopoulos2011[,1,drop=FALSE], school=sequence(table(dat.konstantopoulos2011$district)), dat.konstantopoulos2011[,c(2,5,3:4)])
rownames(dat.konstantopoulos2011) <- 1:nrow(dat.konstantopoulos2011)
attr(dat.konstantopoulos2011, "digits") <- 3
attr(dat.konstantopoulos2011, "yi.names") <- "yi"
attr(dat.konstantopoulos2011, "vi.names") <- "vi"
attr(dat.konstantopoulos2011$yi, "measure") <- "SMD"
class(dat.konstantopoulos2011) <- c("escalc", "data.frame")
save(dat.konstantopoulos2011, file="data/dat.konstantopoulos2011.rda")
