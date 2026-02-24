# data from:
#
#   Huber et al. (2000):
#   Immunostimulation by bacterial components:
#   II. Efficacy studies and meta-analysis of the bacterial extract OM-89
#   International Journal of Immunopharmacology 22(12):1103-1111, 2000.
#   https://doi.org/10.1016/S0192-0561(00)00070-9
#
#   (Table 1)

# Data from Table 1
Frey <- matrix(NA_integer_, nrow=2, ncol=9,
               dimnames=list("group"=c("Uro-Vaxom", "Placebo"),
                             "relapses"=as.character(0:8)))
Tammen <- Magasi <- Pisani <- Schulman <- Frey

Frey[1,]     <- c(14,  8,  3,  1, 1, 0, 0, 0, 0)
Frey[2,]     <- c(10,  5,  9,  3, 3, 0, 1, 0, 0)
Tammen[1,]   <- c(23, 27, 10,  1, 0, 0, 0, 0, 0)
Tammen[2,]   <- c(10, 19, 10, 16, 3, 1, 0, 0, 0)
Magasi[1,]   <- c(39, 14,  2,  3, 0, 0, 0, 0, 0)
Magasi[2,]   <- c(12, 20, 14,  7, 1, 0, 0, 0, 0)
Pisani[1,]   <- c(53, 13,  2,  0, 2, 1, 1, 1, 1)
Pisani[2,]   <- c(39, 21,  7,  4, 1, 1, 2, 0, 2)
Schulman[1,] <- c(39, 22,  8,  4, 1, 5, 1, 2, 0)
Schulman[2,] <- c(14, 21, 15, 14, 9, 4, 0, 1, 0)

# compile counts into single IPD data set
dat.huber2000 <- rbind(cbind.data.frame("study"="Frey (1986)",
                                        "treatment"  =rep(c("Uro-Vaxom","Placebo"),
                                                          rowSums(Frey)),
                                        "recurrences"=c(rep(0:8, Frey[1,]),
                                                        rep(0:8, Frey[2,]))),
                       cbind.data.frame("study"="Tammen (1990)",
                                        "treatment"  =rep(c("Uro-Vaxom","Placebo"),
                                                          rowSums(Tammen)),
                                        "recurrences"=c(rep(0:8, Tammen[1,]),
                                                        rep(0:8, Tammen[2,]))),
                       cbind.data.frame("study"="Schulman (1993)",
                                        "treatment"  =rep(c("Uro-Vaxom","Placebo"),
                                                          rowSums(Schulman)),
                                        "recurrences"=c(rep(0:8, Schulman[1,]),
                                                        rep(0:8, Schulman[2,]))),
                       cbind.data.frame("study"="Magasi (1994)",
                                        "treatment"  =rep(c("Uro-Vaxom","Placebo"),
                                                          rowSums(Magasi)),
                                        "recurrences"=c(rep(0:8, Magasi[1,]),
                                                        rep(0:8, Magasi[2,]))),
                       cbind.data.frame("study"="Pisani (2000)",
                                        "treatment"  =rep(c("Uro-Vaxom","Placebo"),
                                                          rowSums(Pisani)),
                                        "recurrences"=c(rep(0:8, Pisani[1,]),
                                                        rep(0:8, Pisani[2,]))))

dat.huber2000$study <- factor(dat.huber2000$study,
                              levels=c("Frey (1986)", "Tammen (1990)", "Schulman (1993)",
                                       "Magasi (1994)", "Pisani (2000)"))
dat.huber2000$treatment <- factor(dat.huber2000$treatment)

rm(list=c("Frey", "Tammen", "Magasi", "Pisani", "Schulman"))

save("dat.huber2000", file="data/dat.huber2000.rda")
