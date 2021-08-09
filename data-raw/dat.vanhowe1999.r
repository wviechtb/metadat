# Van Howe, R. S. (1999). Circumcision and HIV infection: Review of the
# literature and meta-analysis. International Journal of STD & AIDS, 10(1),
# 8-16.

dat.vanhowe1999 <- read.table("data-raw/dat.vanhowe1999.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.vanhowe1999, file="data/dat.vanhowe1999.rda")
