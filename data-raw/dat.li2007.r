# Li, J., Zhang, Q., Zhang, M., & Egger, M. (2007). Intravenous magnesium for
# acute myocardial infarction. Cochrane Database of Systematic Reviews, 2.

dat.li2007 <- read.table("data-raw/dat.li2007.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.li2007, file="data/dat.li2007.rda")
