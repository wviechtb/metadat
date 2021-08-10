# Craft, L. L., Magyar, T. M., Becker, B. J., & Feltz, D. L. (2003). The
# relationship between the Competitive State Anxiety Inventory-2 and sport
# performance: A meta-analysis. Journal of Sport and Exercise Psychology,
# 25(1), 44-65.

# data from Table 16.1 (page 350) in Cooper et al. (2019), Handbook of
# research synthesis and meta-analysis (3rd ed.).

dat.craft2003 <- read.table("data-raw/dat.craft2003.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.craft2003, file="data/dat.craft2003.rda")
