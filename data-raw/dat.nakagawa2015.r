dat.nakagawa2015.1<-read.csv("data-raw/dat.nakagawa2015.1.csv", stringsAsFactors = FALSE)
dat.nakagawa2015.2<-read.csv("data-raw/dat.nakagawa2015.2.csv", stringsAsFactors = FALSE)
dat.nakagawa2015.3<-read.csv("data-raw/dat.nakagawa2015.3.csv", stringsAsFactors = FALSE)
names(dat.nakagawa2015.1)[1]<-"effect.id"
names(dat.nakagawa2015.2)[1]<-"effect.id"
names(dat.nakagawa2015.3)[1]<-"effect.id"
dat.nakagawa2015.1$reference[which(dat.nakagawa2015.1$reference == "M\xcbller & Nielsen 1997")]<-"Meller & Nielsen 1997"
dat.nakagawa2015.1$reference[which(dat.nakagawa2015.1$reference == "Gonz\x88lez-Sol\xcds et al. 1999")]<-"Gonzalez-Solis et al. 1999"
dat.nakagawa2015.1$reference[which(dat.nakagawa2015.1$reference == "M\xcbller 1990")]<-"Meller 1990"
dat.nakagawa2015.1$reference[which(dat.nakagawa2015.1$reference == "M\xcbller & Mousseau 2003")]<-"Meller  & Mousseau 2003"
dat.nakagawa2015.1$reference[which(dat.nakagawa2015.1$reference == "R\xcbnning et al. 2007")]<-"Renning et al. 2007"
dat.nakagawa2015.2$reference[which(dat.nakagawa2015.2$reference == "L\xe3pez-Mart\xean et al. 2006")]<-"Lapez-Marten et al 2006"
dat.nakagawa2015.2$reference[which(dat.nakagawa2015.2$reference == "Sl\xf6dek 1991")]<-"Slodek 1991"
dat.nakagawa2015.2$reference[which(dat.nakagawa2015.2$reference == "L\xe3pez-Gonz\xf6lez & Polaco 1998")]<-"Lapez-Gonzolez & Polaco 1998"
dat.nakagawa2015.2$reference[which(dat.nakagawa2015.2$reference == "Bechsh\xe8ft et al. 2008")]<-"Bechsheft et al. 2008"
dat.nakagawa2015.2$reference[which(dat.nakagawa2015.2$reference == "L\xe3pez-Fuster et al. 2006")]<-"Lapez-Fuster et al. 2006"
library(ape)
dat.nakagawa2015.phy1<-read.tree("data-raw/dat.nakagawa2015.phy1.tre")
dat.nakagawa2015.phy2<-read.tree("data-raw/dat.nakagawa2015.phy2.tre")
save(dat.nakagawa2015.1, file="data/dat.nakagawa2015.1.rda", ascii=FALSE)
save(dat.nakagawa2015.2, file="data/dat.nakagawa2015.2.rda", ascii=FALSE)
save(dat.nakagawa2015.3, file="data/dat.nakagawa2015.3.rda", ascii=FALSE)
save(dat.nakagawa2015.phy1, file="data/dat.nakagawa2015.phy1.rda", ascii=FALSE)
save(dat.nakagawa2015.phy2, file="data/dat.nakagawa2015.phy2.rda", ascii=FALSE)