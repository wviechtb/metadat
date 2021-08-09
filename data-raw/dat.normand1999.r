# Normand, S. T. (1999). Meta-analysis: Formulating, evaluating, combining,
# and reporting. Statistics in Medicine, 18, 321-359.

dat.normand1999 <- read.table("data-raw/dat.normand1999.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.normand1999, file="data/dat.normand1999.rda")
