dat.hackshaw1998 <- read.table("data-raw/dat.hackshaw1998.txt", header=TRUE, stringsAsFactors=FALSE)
dat.hackshaw1998$study <- 1:nrow(dat.hackshaw1998)
dat.hackshaw1998 <- dat.hackshaw1998[,c(9,1:3,8,4:7)]
dat.hackshaw1998$yi <- round(log(dat.hackshaw1998$or),3)
dat.hackshaw1998$vi <- round(((log(dat.hackshaw1998$ci.ub) - log(dat.hackshaw1998$ci.lb)) / (2*1.96))^2,4)
#dat.hackshaw1998$sei <- round(((log(dat.hackshaw1998$ci.ub) - log(dat.hackshaw1998$ci.lb)) / (2*1.96)),4)
dat.hackshaw1998$or    <- NULL
dat.hackshaw1998$ci.lb <- NULL
dat.hackshaw1998$ci.ub <- NULL
attr(dat.hackshaw1998, "digits") <- 4
attr(dat.hackshaw1998, "yi.names") <- "yi"
attr(dat.hackshaw1998, "vi.names") <- "vi"
attr(dat.hackshaw1998$yi, "measure") <- "OR"
class(dat.hackshaw1998) <- c("escalc", "data.frame")
save(dat.hackshaw1998, file="data/dat.hackshaw1998.rda")
