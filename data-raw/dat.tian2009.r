# Tian, L., Cai, T., Pfeffer, M. A., Piankov, N., Cremieux, P.-Y., & Wei, L.
# J. (2009). Exact and efficient inference procedure for meta-analysis and its
# application to the analysis of independent 2 x 2 tables with all available
# data but without artificial continuity correction. Biostatistics, 10(2),
# 275-281. https://doi.org/10.1093/biostatistics/kxn034

dat.tian2009 <- read.csv("data-raw/dat.tian2009.txt")
save(dat.tian2009, file = "data/dat.tian2009.rda")
