# data from:
#
#   Chiarito M, Sanz-Sánchez J, Cannata F, et al (2020):
#   Monotherapy with a P2Y 12 inhibitor or aspirin for secondary prevention
#   in patients with established atherosclerosis:
#   a systematic review and meta-analysis.
#   The Lancet 395(10235):1487-1495.
#   https://doi.org/10.1016/S0140-6736(20)30315-9

dat.chiarito2020 <- cbind.data.frame("study"           = c("TASS", "CAPRIE", "STAMI", "AAASPS", "CADET",
                                                           "ASCET", "SOCRATES", "DACAB", "TiCAB"),
                                     "year"            = c(1989, 1996, 2001, 2003, 2004, 2012, 2016, 2018, 2019),
                                     # study design features:
                                     "p2y12"                = c("ticlopidine", "clopidogrel", "ticlopidine",
                                                                "ticlopidine", "clopidogrel", "clopidogrel",
                                                                "ticagrelor", "ticagrelor", "ticagrelor"),
                                     "duration.months"      = c(36, 36, 6, 24, 6, 24, 3, 12, 12),
                                     "p2y12.daily.dosage"   = c("250mg twice", "75mg once", "250mg twice",
                                                                "250mg twice", "75mg once", "75mg once",
                                                                "90mg twice", "90mg twice", "90mg twice"),
                                     "aspirin.daily.dosage" = c("650mg twice", "325mg once", "80mg twice",
                                                                "325mg twice", "75mg once", "75mg once",
                                                                "100mg once", "100mg once", "100mg once"),
                                     "p2y12.daily.mg"       = c(500, 75, 500, 500, 75, 75, 180, 180, 180),
                                     "aspirin.daily.mg"     = c(1300, 325, 160, 650, 75, 75, 100, 100, 100),
                                     # baseline data:
                                     baseline.age           = c(62.9, 62.5, 59.2, 61.3, 62.6,
                                                                62.4, 65.8, 63.6, 66.7),
                                     baseline.males         = c(0.647, 0.719, 0.838, 0.465, 0.809,
                                                                0.782, 0.584, 0.828, 0.849),
                                     baseline.diabetes      = c(0.194, 0.200, 0.149, 0.407, NA,
                                                                0.199, 0.243, 0.427, 0.359),
                                     baseline.hypertension  = c(0.392, 0.515, 0.336, 0.850, NA,
                                                                0.554, 0.737, 0.728, 0.899),
                                     baseline.dyslipidaemia = c(0.365, 0.410, 0.360, 0.385, NA,
                                                                   NA, 0.380, 0.731, 0.817),
                                     # outcomes (primary: myocardial infarction, stroke; secondary: death, vascular death):
                                     "p2y12.mi"       = c(  NA,  275,   8,   9,  1,  18,   25,   2,  19),
                                     "p2y12.stroke"   = c( 162,  438,   4, 106, NA,  11,  385,   2,  29),
                                     "p2y12.death"    = c( 175,  560,   7,  45,  5,   5,   68,   0,  22),
                                     "p2y12.vdeath"   = c( 120,  373,   6,  23, NA,  NA,   41,   0,  11),
                                     "p2y12.total"    = c(1529, 9599, 734, 902, 94, 499, 6589, 166, 931),
                                     "aspirin.mi"     = c(  NA,  333,  18,   8,  6,  18,   21,   3,  30),
                                     "aspirin.stroke" = c( 201,  462,   3,  86, NA,  17,  441,   4,  21),
                                     "aspirin.death"  = c( 196,  571,   5,  40,  3,   4,   58,   3,  23),
                                     "aspirin.vdeath" = c( 116,  405,   5,  19, NA,  NA,   35,   2,  13),
                                     "aspirin.total"  = c(1540, 9586, 736, 907, 90, 502, 6610, 166, 928))

# risk-of-bias information:
lowrisk <- factor(rep("low risk",9), levels=c("low risk", "some concerns", "high risk"), ordered=TRUE)
dat.chiarito2020 <- cbind(dat.chiarito2020,
                          "rob.R"=lowrisk,
                          "rob.D"=lowrisk,
                          "rob.Mi"=lowrisk,
                          "rob.Me"=lowrisk,
                          "rob.S"=lowrisk,
                          "rob.overall"=lowrisk)
dat.chiarito2020[1,c("rob.R", "rob.overall")] <- "some concerns"
dat.chiarito2020[3,c("rob.R", "rob.overall")] <- "some concerns"
dat.chiarito2020[4,c("rob.D", "rob.overall")] <- "some concerns"
dat.chiarito2020[6,c("rob.D", "rob.overall")] <- "some concerns"
dat.chiarito2020[8,c("rob.D", "rob.overall")] <- "some concerns"
dat.chiarito2020[9,c("rob.Me", "rob.S", "rob.overall")] <- "some concerns"

save(dat.chiarito2020, file="data/dat.chiarito2020.rda")
