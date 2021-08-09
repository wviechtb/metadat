# Load
dat.white2020 <- read.csv("data-raw/dat.white2020.csv", header=TRUE, stringsAsFactors=FALSE)

# Output
save(dat.white2020, file="data/dat.white2020.rda", ascii=FALSE)
