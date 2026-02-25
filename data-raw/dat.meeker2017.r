# data from:
#
#   W. Q. Meeker, G. J. Hahn,  L. A. Escobar
#   Statistical intervals: a guide for practitioners and researchers
#   Wiley, 2017.
#   Chapter 17: "Statistical intervals for Bayesian hierarchical models"
#
#   Table 17.1: Batting averages in 2014 for teams in the American League
#   Central (AL-C) and the National League Central (NL-C) divisions.

dat.meeker2017 <- cbind.data.frame("team"=c("Chicago White Sox", "Cleveland Indians",
                                            "Detroit Tigers", "Kansas City Royals",
                                            "Minnesota Twins", "Chicago Cubs",
                                            "Cincinatti Reds", "Milwaukee Braves",
                                            "Pittsburgh Pirates", "St. Louis Cardinals"),
                                   "division"=factor(rep(c("AL-C","NL-C"), each=5)),
                                   "mean"=c(0.281, 0.271, 0.294, 0.270, 0.266,
                                            0.268, 0.250, 0.262, 0.251, 0.289),
                                   "se"  =c(0.0325, 0.0382, 0.0304, 0.0122, 0.0204,
                                            0.0390, 0.0445, 0.0256, 0.0229, 0.0369),
                                   "batters"=as.integer(c(5,5,5,7,4,6,7,4,6,7)))

rownames(dat.meeker2017) <- c("CHW", "CLE", "DET", "KC", "MIN",
                              "CHC", "CIN", "MIL", "PIT", "STL")

save(dat.meeker2017, file="data/dat.meeker2017.rda")
