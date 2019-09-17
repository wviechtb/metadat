# Load
# This csv file was downloaded from https://osf.io/re8uj/?view_only=d2605771dd664831a104318db9ff7aa9 on Sept 13, 2019
dat.barone2019 <- read.csv("data-raw/dat.barone2019.csv", header=TRUE,  sep=";", stringsAsFactors=FALSE)

# Output
save(dat.barone2019, file="data/dat.barone2019.rda", ascii=FALSE)
