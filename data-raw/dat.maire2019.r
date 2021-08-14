# Maire, A., Thierry, E., Viechtbauer, W., & Daufresne, M. (2019). Poleward
# shift in large-river fish communities detected with a novel meta-analysis
# framework. Freshwater Biology, 64(6), 1143-1156.

# data from ~/work/meta_analysis/data/maire2019/

dat <- read.table("data-raw/dat.maire2019.data.txt", header=TRUE, stringsAsFactors=FALSE)
dmat <- read.table("data-raw/dat.maire2019.dmat.txt", header=TRUE)
dmat <- as.matrix(dmat)
dat.maire2019 <- list(dat=dat, dmat=dmat)
save(dat.maire2019, file="data/dat.maire2019.rda")
