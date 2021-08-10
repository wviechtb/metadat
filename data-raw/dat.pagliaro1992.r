# Pagliaro, L., D'Amico, G., Sörensen, T. I. A., Lebrec, D., Burroughs, A. K.,
# Morabito, A., Tiné, F., Politi, F., & Traina, M. (1992). Prevention of first
# bleeding in cirrhosis: A meta-analysis of randomized trials of nonsurgical
# treatment. Annals of Internal Medicine, 117(1), 59-70.

# data from: Lu, G., & Ades, A. E. (2004). Combination of direct and indirect
# evidence in mixed treatment comparisons. Statistics in Medicine, 23(20),
# 3105-3124.

dat.pagliaro1992 <- read.table("data-raw/dat.pagliaro1992.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.pagliaro1992, file="data/dat.pagliaro1992.rda")
