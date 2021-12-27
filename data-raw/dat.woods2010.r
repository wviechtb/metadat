# Woods BS, Hawkins N, Scott DA (2010).
# Network meta-analysis on the log-hazard scale, combining count and
# hazard ratio statistics accounting for multi-arm trials: A
# tutorial.
# BMC Medical Research Methodology, 10, 54.

dat.woods2010 <- read.csv("data-raw/dat.woods2010.txt")
save(dat.woods2010, file="data/dat.woods2010.rda")
