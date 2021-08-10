# Collins, R., Yusuf, S., & Peto, R. (1985). Overview of randomised trials of
# diuretics in pregnancy. British Medical Journal, 290(6461), 17-23.

dat.collins1985b <- read.table("data-raw/dat.collins1985b.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.collins1985b, file="data/dat.collins1985b.rda")
