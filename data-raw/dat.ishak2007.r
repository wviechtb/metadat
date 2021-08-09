# Ishak, K. J., Platt, R. W., Joseph, L., Hanley, J. A., & Caro, J. J. (2007).
# Meta-analysis of longitudinal studies. Clinical Trials, 4(5), 525-539.

suppressPackageStartupMessages(library(metafor, quietly=TRUE))

dat.ishak2007 <- read.table("data-raw/dat.ishak2007.txt", header=TRUE, stringsAsFactors=FALSE)
dat.ishak2007 <- escalc(measure="MD", yi=y1i, vi=v1i, data=dat.ishak2007, var.names=c("y1i","v1i"), digits=1)
dat.ishak2007 <- escalc(measure="MD", yi=y2i, vi=v2i, data=dat.ishak2007, var.names=c("y2i","v2i"), digits=1)
dat.ishak2007 <- escalc(measure="MD", yi=y3i, vi=v3i, data=dat.ishak2007, var.names=c("y3i","v3i"), digits=1)
dat.ishak2007 <- escalc(measure="MD", yi=y4i, vi=v4i, data=dat.ishak2007, var.names=c("y4i","v4i"), digits=1)
save(dat.ishak2007, file="data/dat.ishak2007.rda")
