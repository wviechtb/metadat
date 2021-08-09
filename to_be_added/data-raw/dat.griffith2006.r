# Load
dat.griffith2006 <- read.csv("data-raw/dat.griffith2006.csv", header=TRUE, stringsAsFactors=FALSE)

# Output
save(dat.griffith2006, file="data/dat.griffith2006.rda", ascii=FALSE)
