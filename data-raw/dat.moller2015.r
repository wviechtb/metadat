# Møller, A. P., & Mousseau, T. A. (2015). Strong Effects of Ionizing 
# Radiation from Chernobyl on Mutation Rates. Scientific Reports, 5, 8363.

dat.moller2015 <- read.table("data-raw/dat.moller2015.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.moller2015 , file="data/dat.moller2015.rda")