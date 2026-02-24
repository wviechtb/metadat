# COPD data from:
#
#   C. Karner, J. Chong, P. Poole.
#   Tiotropium versus placebo for chronic obstructive pulmonary disease.
#   Cochrane Database of Systematic Reviews, 7:CD009285, 2014.
#   http://doi.org/10.1002/14651858.CD009285.pub3
#
#   exacerbation:           Analysis 1.9
#   severe exacerbation:    Analysis 1.14
#   hospitalisation:        Analysis 1.15
#   mortality:              Analysis 1.19
#   serious adverse event:  Analysis 1.27
#   dropout (withdrawal):   Analysis 1.28
#   SGRQ:                   Analysis 1.1
#   FEV_1:                  Analysis 1.26
#   risk-of-bias:           Figure 2

dat.karner2014 <- cbind.data.frame("study" = c("Bateman2010a", "Bateman2010b", "Beeh2006", "Brusasco2003",
                                               "Casaburi2002", "Chan2007", "Cooper2010", "Covelli2005",
                                               "Dusser2006", "Freeman2007", "Johansson2008", "Magnussen2008",
                                               "Moita2008", "NCT00144326", "Niewoehner2005", "Powrie2007",
                                               "Sun2007", "Tashkin2008", "Tonnel2008", "Trooster2011",
                                               "Verkindre2006", "Voshaar2008"),
                                   "year" = c(2010,2010,2006,2003,2002,2007,2010,2005,2006,2007,
                                              2008,2008,2008,2005,2005,2007,2007,2008,2008,2011,
                                              2006,2008),
                                   "duration" = factor(c("up to 1 year","1 year or longer")[c(2,2,1,1,2,2,2,1,
                                                                                              2,1,1,1,1,1,1,2,
                                                                                              1,2,1,1,1,1)]),
                                   "inhaler" = factor(c("dry powder","soft mist")[c(2,2,1,1,1,1,1,1,
                                                                                    1,1,1,1,1,1,1,1,
                                                                                    1,1,1,1,1,2)]),
                                   ###################
                                   "baseline.age"       = c(65, 65, 62, 64,  65, 67, 65, 65,  65, 65, 62, 60,
                                                            64, 63, 68, 66,  62, 65, 64, 62,  60, 64),
                                   "baseline.males"     = c(0.78, 0.74, 0.76, 0.77,  0.64, 0.60, 0.77, NA,
                                                            0.88, NA, NA, 0.61,  0.95, 0.78, 0.98, NA,
                                                            NA, 0.75, 0.86, 0.69,  0.94, 0.70),
                                   "baseline.fev1"      = c(1.10, 1.06, 1.30, 1.10,  1.00, 0.97, 1.10, 1.00,
                                                            1.40, 1.30, 2.10, 1.50,  1.20, 1.30, 1.00, 1.30,
                                                            1.30, 1.10, 1.40, 2.00,  1.10, 1.10),
                                   "baseline.fev1pp"    = c(40, 38, 45, 39,  39, 39, 38, 39,  48, 49, 73, 53,
                                                            NA, 46, 36, 50,  47, 39, 44, 66,  35, 52),
                                   "baseline.pyr"       = c(45, 48, 36, 43,  NA, 51, 52, 66,  43, 37, 31, 34,
                                                            NA, NA, 68, 55,  NA, 49, 44, NA,  44, 52),
                                   ###################
                                   "tiotropium.total"   = c(1989, 1337, 1236, 402, 550, 608, 260, 100, 500, 200,
                                                            107, 228, 147, 123, 914, 69, 30, 2987, 266, 238,
                                                            46, 360),
                                   "tiotropium.exa"     = c(685, 495, 180, 129, 198, 268, 112, 9, 213, 19,
                                                            2, 13, 6, 11, 255, 30, 0, 2001, 101, 11,
                                                            10, 43),
                                   "tiotropium.sexa"    = c(161, 78, 29, 48,  30, 51, 21, 2,  28, 2, 0, 4,
                                                            1, 2, 64, 2,  0, 759, 11, NA,  0, 2),
                                   "tiotropium.hospi"   = c(304, 198, 55, 48, 90, 105, 57, 5,
                                                            88, 7, 3, 9, 5, 6, NA, 15,
                                                            NA, 1369, 40, NA, 2, 11),
                                   "tiotropium.deaths"  = c(52, 34, 2, 1, 7, 13, 6, 0, 7, 1,
                                                            0, 0, 2, 0, 22, 1, 0, 381, 3, 0,
                                                            0, 2),
                                   "tiotropium.sae"     = c(342, 233, 63, 37,  99, 108, 63, 5,  86, 6, 3, 10,
                                                            4, 6, 140, 15,  0, 1541, 42, 10,  2, 12),
                                   "tiotropium.dropout" = c(318, 251, 218, 62,  103, 135, 66, 10,  117, 18, 2, 5,
                                                            11, 10, 149, 21,  0, 1099, 39, 27,  1, 34),
                                   ###################
                                   "placebo.total"      = c(2002, 653, 403, 400, 371, 305, 259, 96, 510, 195,
                                                            117, 244, 164, 127, 915, 73, 30, 3006, 288, 219,
                                                            54, 181),
                                   "placebo.exa"        = c(842, 288, 80, 156, 156, 125, 102, 12, 272, 35,
                                                            4, 26, 6, 12, 296, 47, 2, 2049, 130, 24,
                                                            8, 21),
                                   "placebo.sexa"       = c(198, 44, 7, 90,  35, 19, 16, 1,  33, 1, 0, 0,
                                                            1, 0, 87, 3,  2, 811, 8, NA,  3, 0),
                                   "placebo.hospi"      = c(318, 99, 17, 90, 64, 39, 52, 5,
                                                            93, 10, 1, 3, 3, 4, NA, 13,
                                                            NA, 1357, 34, NA, 6, 5),
                                   "placebo.deaths"     = c(38, 10, 2, 5, 7, 2, 6, 0, 8, 4,
                                                            1, 2, 0, 0, 19, 2, 0, 411, 6, 0,
                                                            0, 0),
                                   "placebo.sae"        = c(336, 110,22, 52,  78, 42, 59, 5,  96, 10, 1, 5,
                                                            3, 4, 137, 11,  0, 1509, 38, 11,  6, 5),
                                   "placebo.dropout"    = c(373, 205, 90, 103,  103, 84, 96, 17,  147, 33, 4, 11,
                                                            11, 15, 245, 21,  3, 1358, 74, 21,  9, 22),
                                   ###################
                                   "sgrq.md"            = c(-2.90, -3.65, NA, -2.70, -3.44, -2.79, -4.03, NA, NA, NA,
                                                            NA, NA, NA, NA, NA, NA, NA, -2.28, -4.18, NA,
                                                            -6.50, NA),
                                   "sgrq.se"            = c(0.49, 0.59, NA, 0.99, 0.92, 0.97, 1.5, NA, NA, NA,
                                                            NA, NA, NA, NA, NA, NA, NA, 0.38, 1.27, NA,
                                                            2.9, NA),
                                   "fev1.md"            = c(101, 141, 79, 120, 150, 100, 75, 184, 120, 60,
                                                            119, 98, 102, 70, 100, 190, 209, 107, 104, 166,
                                                            110, 134),
                                   "fev1.se"            = c(10, 6, 17, 7, 14, 20, 27, 37, 20, 23,
                                                            32, 23, 31, 56, 13, 88, 54, 7, 34, 29,
                                                            42, 19),
                                   ###################
                                   rob.rand             = factor("low", levels=c("low", "unclear", "high"), ordered=TRUE),
                                   rob.alloc            = factor("low", levels=c("low", "unclear", "high"), ordered=TRUE),
                                   rob.perf             = factor("low", levels=c("low", "unclear", "high"), ordered=TRUE),
                                   rob.det              = factor("low", levels=c("low", "unclear", "high"), ordered=TRUE),
                                   rob.att              = factor("low", levels=c("low", "unclear", "high"), ordered=TRUE),
                                   rob.rep              = factor("low", levels=c("low", "unclear", "high"), ordered=TRUE),
                                   ###################
                                   stringsAsFactors=FALSE)
dat.karner2014[17,"rob.alloc"] <- "unclear"
dat.karner2014[17,"rob.det"] <- "unclear"
dat.karner2014[c(3:6,8:10,15:16,19,21),"rob.att"] <- "unclear"
dat.karner2014[c(2,7,18),"rob.att"] <- "high"
dat.karner2014[8,"rob.rep"] <- "unclear"

save("dat.karner2014", file="data/dat.karner2014.rda")
