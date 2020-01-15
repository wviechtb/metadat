# Load
# This csv file was generated from an excel file which was downloaded from https://osf.io/h9sjk/ on Jan 15, 2020
# Paper and link to the data can be found here https://www.collabra.org/articles/10.1525/collabra.203/#additional-files
dat.sala2019 <- read.csv("data-raw/dat.sala2019.csv", header=TRUE, stringsAsFactors=FALSE)

# Output
save(dat.sala2019, file="data/dat.sala2019.rda", ascii=FALSE)
