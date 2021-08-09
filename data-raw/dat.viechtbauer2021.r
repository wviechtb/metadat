# Viechtbauer, W. (2021). Model checking in meta-analysis. In C. H. Schmid, T.
# Stijnen, & I. R. White (Eds.), Handbook of meta-analysis (pp. 219-254). Boca
# Raton, FL: CRC Press.

dat.viechtbauer2021 <- read.table("data-raw/dat.viechtbauer2021.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.viechtbauer2021, file="data/dat.viechtbauer2021.rda")
