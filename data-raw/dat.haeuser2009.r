# Häuser, W., Bernardy, K., Üçeyler, N., & Sommer, C. (2009). Treatment of
# fibromyalgia syndrome with antidepressants: A meta-analysis. Journal of the
# American Medical Association, 301(2), 198-209.
# https://doi.org/10.1001/jama.2008.944

dat.haeuser2009 <- read.table("data-raw/dat.haeuser2009.txt", header=TRUE)
save(dat.haeuser2009, file="data/dat.haeuser2009.rda")
