dat.xia2008<- read.csv("data-raw/dat.xia2008.csv", encoding = "UTF-8")
dat.xia2008$Seed.plant.Spore.plant<-as.character(dat.xia2008$Seed.plant.Spore.plant)
dat.xia2008$Seed.plant.Spore.plant[which(dat.xia2008$Seed.plant.Spore.plant == "SporePlant")]<-"Sporeplant"
dat.xia2008$Seed.plant.Spore.plant<-as.factor(dat.xia2008$Seed.plant.Spore.plant)
dat.xia2008$Woody.Herbaceous[which(dat.xia2008$Woody.Herbaceous == "")]<-NA
dat.xia2008$Broadleaved.tree.Coniferous.tree[which(dat.xia2008$Broadleaved.tree.Coniferous.tree == "*")]<-NA
dat.xia2008$Evergreen.tree.Deciduous.tree[which(dat.xia2008$Evergreen.tree.Deciduous.tree == "*")]<-NA
dat.xia2008$Legume.Non.legume[which(dat.xia2008$Legume.Non.legume == "*")]<-NA
dat.xia2008$Annual.herb.Perennial.herb[which(dat.xia2008$Annual.herb.Perennial.herb == "*")]<-NA
dat.xia2008$Grass.Forb.Shrub.Tree[which(dat.xia2008$Grass.Forb.Shrub.Tree == "*")]<-NA
dat.xia2008$C3.C4[which(dat.xia2008$C3.C4 == "*")]<-NA
dat.xia2008$C3.C4[which(dat.xia2008$C3.C4 == "c3")]<-"C3"
dat.xia2008$C3.C4[which(dat.xia2008$C3.C4 == "c4")]<-"C4"
dat.xia2008$Tissue.types[which(dat.xia2008$Tissue.types == "Shoot")]<-"shoot"
dat.xia2008$Tissue.types[which(dat.xia2008$Tissue.types == "stems")]<-"stem"
dat.xia2008$Tissue.types[which(dat.xia2008$Tissue.types == "Stems")]<-"stem"
dat.xia2008$N.amount..g.m.2yr.1.[which(dat.xia2008$N.amount..g.m.2yr.1. == "*")]<-NA
dat.xia2008$N.amount..g.m.2yr.1.<-as.numeric(dat.xia2008$N.amount..g.m.2yr.1.)
dat.xia2008$MAT[which(dat.xia2008$MAT == "*")]<-NA
dat.xia2008$MAT<-as.numeric(dat.xia2008$MAT)
dat.xia2008$MAP.mm.[which(dat.xia2008$MAP.mm. == "*")]<-NA
dat.xia2008$MAP.mm.<-as.numeric(dat.xia2008$MAP.mm.)
dat.xia2008$Latitude[which(dat.xia2008$Latitude == "*")]<-NA
dat.xia2008$Latitude<-as.numeric(dat.xia2008$Latitude)
names(dat.xia2008)[1]<-"Species_name"
names(dat.xia2008)[2]<-"Seedplant_Sporeplant"
names(dat.xia2008)[3]<-"Woody_Herbaceous"
names(dat.xia2008)[4]<-"Broadleaved_Coniferous"
names(dat.xia2008)[5]<-"Evergreen_Deciduous"
names(dat.xia2008)[6]<-"Legume_Nonlegume"
names(dat.xia2008)[7]<-"Annual_Perennial"
names(dat.xia2008)[8]<-"Grass_Forb_Shrub_Tree"
names(dat.xia2008)[9]<-"C3_C4"
names(dat.xia2008)[10]<-"Tissue_type"
names(dat.xia2008)[19]<-"N_amount_g.m.2yr.1"
dat.xia2008[,c(1:10, 17, 18)]<-data.frame(lapply(dat.xia2008[,c(1:10, 17, 18)], as.character), stringsAsFactors=FALSE)
dat.xia2008<-dat.xia2008[,-dim(dat.xia2008)[2]]
save(dat.xia2008, file="data/dat.xia2008.rda", ascii=FALSE)
