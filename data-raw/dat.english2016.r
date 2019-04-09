dat.english2016.1<- read.csv("data-raw/dat.english2016.1.csv", stringsAsFactors = FALSE)
names(dat.english2016.1)[17]<-"yi"
names(dat.english2016.1)[18]<-"vi"
save(dat.english2016.1, file="data/dat.english2016.1.rda", ascii=FALSE)
dat.english2016.2<- read.csv("data-raw/dat.english2016.2.csv", stringsAsFactors = FALSE)
save(dat.english2016.1, file="data/dat.english2016.2.rda", ascii=FALSE)