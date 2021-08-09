# Kearon, C., Julian, J. A., Math, M., Newman, T. E., & Ginsberg, J. S.
# (1998). Noninvasive diagnosis of deep venous thrombosis. Annals of Internal
# Medicine, 128(8), 663-677.

dat.kearon1998 <- read.table("data-raw/dat.kearon1998.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.kearon1998, file="data/dat.kearon1998.rda")
