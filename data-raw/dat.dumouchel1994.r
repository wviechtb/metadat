dat.dumouchel1994 <- read.csv("data-raw/dat.dumouchel1994.csv")

for (i in 2:4)
  dat.dumouchel1994[,i] <- factor(dat.dumouchel1994[,i],
                                  levels=c("no","yes"))

save(dat.dumouchel1994, file="data/dat.dumouchel1994.rda")
