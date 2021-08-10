# Bonett, D. G. (2010). Varying coefficient meta-analytic methods for alpha
# reliability. Psychological Methods, 15(4), 368-385.

dat.bonett2010 <- read.table("data-raw/dat.bonett2010.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.bonett2010, file="data/dat.bonett2010.rda")
