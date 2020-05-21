dat.sorokowski2019.1<-read.csv("data-raw/dat.sorokowski2019.1.csv", stringsAsFactors = FALSE)
dat.sorokowski2019.2<-read.csv("data-raw/dat.sorokowski2019.2.csv", stringsAsFactors = FALSE)

save(dat.sorokowski2019.1, file="data/dat.sorokowski2019.1.rda", ascii=FALSE)
save(dat.sorokowski2019.2, file="data/dat.sorokowski2019.2.rda", ascii=FALSE)