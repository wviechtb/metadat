# Anand, S. S., & Yusuf, S. (1999). Oral anticoagulant therapy in patients
# with coronary artery disease: A meta-analysis. Journal of the American
# Medical Association, 282(21), 2058-2067.

dat.anand1999 <- read.table("data-raw/dat.anand1999.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.anand1999, file="data/dat.anand1999.rda")
