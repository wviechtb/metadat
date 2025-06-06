# Nissen SE, Wolski K (2007).
# Effect of rosiglitazone on the risk of myocardial infarction and
# death from cardiovascular causes.
# New England Journal of Medicine, 356, 2457-71.

dat.nissen2007 <- read.csv("data-raw/dat.nissen2007.txt")
save(dat.nissen2007, file = "data/dat.nissen2007.rda")
