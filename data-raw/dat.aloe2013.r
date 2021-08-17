# Aloe, A. M., & Thompson, C. G. (2013). The synthesis of partial effect
# sizes. Journal of the Society for Social Work and Research, 4(4), 390-405.
# https://doi.org/10.5243/jsswr.2013.24

dat.aloe2013 <- read.table("data-raw/dat.aloe2013.txt", header=TRUE, stringsAsFactors=FALSE)
dat.aloe2013 <- dat.aloe2013[c(1,4,3,5,2)]
save(dat.aloe2013, file="data/dat.aloe2013.rda")
