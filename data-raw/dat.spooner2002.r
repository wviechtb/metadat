# Spooner C, Saunders LD, Rowe BH (2002).
# Nedocromil sodium for preventing exercise‐induced
# bronchoconstriction.
# Cochrane Database of Systematic Reviews, CD001183.

dat.spooner2002 <- read.csv("data-raw/dat.spooner2002.csv")
dat.spooner2002$agegroup <-
  factor(dat.spooner2002$agegroup, levels = c("Children", "Adults"))
#
save(dat.spooner2002, file = "data/dat.spooner2002.rda")
