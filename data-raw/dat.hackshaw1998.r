# Hackshaw, A. K. (1998). Lung cancer and passive smoking. Statistical Methods
# in Medical Research, 7(2), 119-136.

suppressPackageStartupMessages(library(metafor, quietly=TRUE))

dat.hackshaw1998 <- read.table("data-raw/dat.hackshaw1998.txt", header=TRUE, stringsAsFactors=FALSE)
dat.hackshaw1998$study <- 1:nrow(dat.hackshaw1998)
dat.hackshaw1998 <- dat.hackshaw1998[,c(9,1:3,8,4:7)]
dat.hackshaw1998$yi <- log(dat.hackshaw1998$or)
if (F) {
   # check if CIs are symmetric
   dif <- round((log(dat.hackshaw1998$ci.ub) - log(dat.hackshaw1998$or)) - (log(dat.hackshaw1998$or) - log(dat.hackshaw1998$ci.lb)), 2)
   cbind(dat.hackshaw1998, dif)[abs(dif) >= .05,]
}
dat.hackshaw1998$vi <- ((log(dat.hackshaw1998$ci.ub) - log(dat.hackshaw1998$ci.lb)) / (2*qnorm(.975)))^2
#dat.hackshaw1998$sei <- round(((log(dat.hackshaw1998$ci.ub) - log(dat.hackshaw1998$ci.lb)) / (2*1.96)),4)
#dat.hackshaw1998$or    <- NULL
#dat.hackshaw1998$ci.lb <- NULL
#dat.hackshaw1998$ci.ub <- NULL
names(dat.hackshaw1998)[names(dat.hackshaw1998) == "ci.lb"] <- "or.lb"
names(dat.hackshaw1998)[names(dat.hackshaw1998) == "ci.ub"] <- "or.ub"
dat.hackshaw1998 <- escalc(measure="OR", yi=yi, vi=vi, data=dat.hackshaw1998)
save(dat.hackshaw1998, file="data/dat.hackshaw1998.rda")
