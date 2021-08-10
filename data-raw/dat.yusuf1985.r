# Yusuf, S., Peto, R., Lewis, J., Collins, R., & Sleight, P. (1985). Beta
# blockade during and after myocardial infarction: An overview of the
# randomized trials. Progress in Cardiovascular Disease, 27(5), 335-371.

dat.yusuf1985 <- read.table("data-raw/dat.yusuf1985.txt", header=TRUE, as.is=TRUE, colClasses=c(id="character"))
save(dat.yusuf1985, file="data/dat.yusuf1985.rda")
