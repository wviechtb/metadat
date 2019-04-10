dat.curtis1998 <- read.table("data-raw/dat.curtis1998.txt", header=FALSE, stringsAsFactors=FALSE)
dat.curtis1998[dat.curtis1998$V4 == "mg", "V19"] <- dat.curtis1998[dat.curtis1998$V4 == "mg", "V19"]/1000
dat.curtis1998[dat.curtis1998$V4 == "mg", "V21"] <- dat.curtis1998[dat.curtis1998$V4 == "mg", "V21"]/1000
dat.curtis1998[dat.curtis1998$V4 == "mg", "V23"] <- dat.curtis1998[dat.curtis1998$V4 == "mg", "V23"]/1000
dat.curtis1998[dat.curtis1998$V4 == "mg", "V25"] <- dat.curtis1998[dat.curtis1998$V4 == "mg", "V25"]/1000
dat.curtis1998 <- dat.curtis1998[,-c(3,4,7,18,20,24)]
dat.curtis1998 <- cbind(dat.curtis1998[,1:14], dat.curtis1998[,18:20], dat.curtis1998[,15:17])
names(dat.curtis1998) <- c("id", "paper", "genus", "species", "fungrp", "co2.ambi", "co2.elev", "units", "time", "pot", "method", "stock", "xtrt", "level", "m1i", "sd1i", "n1i", "m2i", "sd2i", "n2i")
dat.curtis1998$level[dat.curtis1998$level == "HI"] <- "HIGH"
#temp <- table(dat.curtis1998$xtrt, dat.curtis1998$level); addmargins(temp)
save(dat.curtis1998, file="data/dat.curtis1998.rda")
