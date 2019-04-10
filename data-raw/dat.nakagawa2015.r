dat.nakagawa2015.1<-read.csv("data-raw/dat.nakagawa2015.1.csv", stringsAsFactors = FALSE)
dat.nakagawa2015.2<-read.csv("data-raw/dat.nakagawa2015.2.csv", stringsAsFactors = FALSE)
dat.nakagawa2015.3<-read.csv("data-raw/dat.nakagawa2015.3.csv", stringsAsFactors = FALSE)
names(dat.nakagawa2015.1)[1]<-"effect.id"
names(dat.nakagawa2015.2)[1]<-"effect.id"
names(dat.nakagawa2015.3)[1]<-"effect.id"
library(ape)
dat.nakagawa2015.phy1<-read.tree("data-raw/dat.nakagawa2015.phy1.tre")
dat.nakagawa2015.phy2<-read.tree("data-raw/dat.nakagawa2015.phy2.tre")
save(dat.nakagawa2015.1, file="data/dat.nakagawa2015.1.rda", ascii=FALSE)
save(dat.nakagawa2015.2, file="data/dat.nakagawa2015.2.rda", ascii=FALSE)
save(dat.nakagawa2015.3, file="data/dat.nakagawa2015.3.rda", ascii=FALSE)
save(dat.nakagawa2015.phy1, file="data/dat.nakagawa2015.phy1.rda", ascii=FALSE)
save(dat.nakagawa2015.phy2, file="data/dat.nakagawa2015.phy2.rda", ascii=FALSE)