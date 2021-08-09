# Hasselblad, V. (1998). Meta-analysis of multitreatment studies. Medical
# Decision Making, 18(1), 37-43.

dat.hasselblad1998 <- read.table("data-raw/dat.hasselblad1998.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.hasselblad1998, file="data/dat.hasselblad1998.rda")
