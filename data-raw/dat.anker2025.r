# data from:
#
#   S. D. Anker et al.
#   Systematic review and meta-analysis of intravenous iron
#   for patients with heart failure and iron deficiency.
#   Nature Medicine, 31(8):2640-2646, 2025.
#   https://doi.org/10.1038/s41591-025-03671-1
#
#   Figure 2, Table 2,
#   Supplementary Figures 4 and 12.

# read effect estimates from CSV file
esti <- read.csv("data-raw/dat.anker2025.csv")

# assemble estimates and additional figures
dat.anker2025 <- cbind.data.frame("study"        =esti$study,
                                  "year"         =c(2009,2015,2020,2022,2023,2025),
                                  "intv.n"       =c(304,150,558,569,1533,558),
                                  "placebo.n"    =c(155,151,550,568,1532,547),
                                  "iv.iron"      =factor(c("carboxymaltose","derisomaltose")[c(1,1,1,2,1,1)]),
                                  "size"         =factor(c("small","large")[c(1,1,2,2,2,2)],
                                                         levels=c("small","large")),
                                  "followup"     =c(6,12,12,32,25,17),
                                  "baseline.age" =c(67,70,71,74,69,70),
                                  "baseline.lvef"=c(33,37,33,35,31,34),
                                  "baseline.hgb" =c(11.9,12.4,12.2,12.1,12.6,12.5),
                                  "baseline.ft"  =c(56,57,86,50,57,73),
                                  "baseline.tsat"=c(17,19,15,15,24,19),
                                  "total.n"      =c(459, 301, 1108, 1137, 3065, 1105),
                                  "total.logrr"  =esti$total.logrr,
                                  "total.se"     =esti$total.se,
                                  "female.n"     =c(244, 141, 494, 300, 1037, 368),
                                  "female.logrr" =esti$female.logrr,
                                  "female.se"    =esti$female.se,
                                  "male.n"       =c(215,160,614,837,2028,737),
                                  "male.logrr"   =esti$male.logrr,
                                  "male.se"      =esti$male.se,
                                  "sex.logrrr"   =esti$sex.logrrr,
                                  "sex.se"       =esti$sex.se)

# adjust column types
for (column in c("year","intv.n","placebo.n","total.n","female.n","male.n")) {
   dat.anker2025[,column] <- as.integer(dat.anker2025[,column])
}

# save data
save(dat.anker2025, file="data/dat.anker2025.rda")
