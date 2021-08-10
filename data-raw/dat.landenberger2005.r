# Landenberger, N. A., & Lipsey, M. W. (2005). The positive effects of
# cognitive-behavioral programs for offenders: A meta-analysis of factors
# associated with effective treatment. Journal of Experimental Criminology, 1,
# 451-476.

# Lipsey, M. W., Landenberger, N. A., & Wilson, S. J. (2007). Effects of
# cognitive-behavioral programs for criminal offenders. Campbell Systematic
# Reviews, 6.

dat.landenberger2005 <- read.table("data-raw/dat.landenberger2005.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.landenberger2005, file="data/dat.landenberger2005.rda")
