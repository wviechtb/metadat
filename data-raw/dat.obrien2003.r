# O'Brien, T. E., Ray, J. G., & Chan, W.-S. (2003). Maternal body mass index
# and the risk of preeclampsia: A systematic overview. Epidemiology, 14(3),
# 368-374.

dat.obrien2003 <- read.table("data-raw/dat.obrien2003.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.obrien2003, file="data/dat.obrien2003.rda")
