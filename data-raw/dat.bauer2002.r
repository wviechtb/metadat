# data from:
#
#   Bauer et al. (2002):
#   Prevention of recurrent urinary tract infections with immuno-active
#   E. coli fractions: a meta-analysis of five placebo-controlled
#   double-blind studies.
#   International Journal of Antimicrobial Agents 19(6):451-456, 2002.
#   DOI:10.1016/S0924-8579(02)00106-1
#
#   (Table 2)

dat.bauer2002 <- cbind.data.frame("study"    = c("Frey", "Tammen", "Magasi",
                                                 "Pisani", "Schulman"),
                                  "year"     = as.integer(c(1986, 1990, 1994, NA, 1993)),
                                  "threshold"= factor(c("1e4","1e5")[c(1,1,2,2,1)],
                                                      ordered=TRUE),
                                  "n.treat"  = as.integer(c(27, 61, 58, 74, 82)),
                                  "n.control"= as.integer(c(31, 59, 54, 77, 78)),
                                  "n.total"  = as.integer(c(58, 120, 112, 151, 160)),
                                  "wmwstat"  = c(0.6630, 0.7140, 0.7550, 0.6210, 0.6790),
                                  "lower"    = c(0.5255, 0.6205, 0.6665, 0.5455, 0.5965),
                                  "upper"    = c(0.8005, 0.8075, 0.8435, 0.6965, 0.7615),
                                  "stderr"   = c(0.0702, 0.0477, 0.0452, 0.0385, 0.0421))[c(1,2,5,3,4),]

save("dat.bauer2002", file="data/dat.bauer2002.rda")
