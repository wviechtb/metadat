# Baskerville, N. B., Liddy, C., & Hogg, W. (2012). Systematic review and
# meta-analysis of practice facilitation within primary care settings. Annals
# of Family Medicine, 10(1), 63-74.

dat.baskerville2012 <- read.table("data-raw/dat.baskerville2012.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.baskerville2012, file="data/dat.baskerville2012.rda")
