# Cohen, P. A. (1981). Student ratings of instruction and student achievement:
# A meta-analysis of multisection validity studies. Review of Educational
# Research, 51(3), 281-309.

dat.cohen1981 <- read.table("data-raw/dat.cohen1981.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.cohen1981, file="data/dat.cohen1981.rda")
