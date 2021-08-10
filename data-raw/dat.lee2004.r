# Lee, A., & Done, M. L. (2004). Stimulation of the wrist acupuncture point P6
# for preventing postoperative nausea and vomiting. Cochrane Database of
# Systematic Reviews(3), CD003281.

dat.lee2004 <- read.table("data-raw/dat.lee2004.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.lee2004, file="data/dat.lee2004.rda")
