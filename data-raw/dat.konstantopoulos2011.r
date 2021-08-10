# Konstantopoulos, S. (2011). Fixed effects and variance components estimation
# in three-level meta-analysis. Research Synthesis Methods, 2(1), 61-76.

# Cooper, H., Valentine, J. C., Charlton, K., & Melson, A. (2003). The effects
# of modified school calendars on student achievement and on school and
# community attitudes. Review of Educational Research, 73(1), 1-52.

suppressPackageStartupMessages(library(metafor, quietly=TRUE))

dat.konstantopoulos2011 <- read.table("data-raw/dat.konstantopoulos2011.txt", header=TRUE, stringsAsFactors=FALSE)
#dat.konstantopoulos2011 <- dat.konstantopoulos2011[,c(1,2,5,3,4)]
dat.konstantopoulos2011 <- cbind(dat.konstantopoulos2011[,1,drop=FALSE], school=sequence(table(dat.konstantopoulos2011$district)), dat.konstantopoulos2011[,c(2,5,3:4)])
rownames(dat.konstantopoulos2011) <- 1:nrow(dat.konstantopoulos2011)
dat.konstantopoulos2011 <- escalc(measure="SMD", yi=yi, vi=vi, data=dat.konstantopoulos2011, digits=3)
save(dat.konstantopoulos2011, file="data/dat.konstantopoulos2011.rda")
