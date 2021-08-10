# Berkey, C. S., Hoaglin, D. C., Antczak-Bouckoms, A., Mosteller, F., &
# Colditz, G. A. (1998). Meta-analysis of multiple outcomes by regression with
# random effects. Statistics in Medicine, 17, 2537-2550.

dat.berkey1998 <- read.table("data-raw/dat.berkey1998.txt", header=TRUE, stringsAsFactors=FALSE)
attr(dat.berkey1998, "digits") <- 4
attr(dat.berkey1998, "yi.names") <- "yi"
attr(dat.berkey1998, "vi.names") <- "vi"
attr(dat.berkey1998$yi, "measure") <- "MD"
attr(dat.berkey1998$yi, "ni") <- dat.berkey1998$ni
class(dat.berkey1998) <- c("escalc", "data.frame")
save(dat.berkey1998, file="data/dat.berkey1998.rda")
