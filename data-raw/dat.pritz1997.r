# Pritz, M. B. (1997). Treatment of cerebral vasospasm due to aneurysmal
# subarachnoid hemorrhage: Past, present, and future of hyperdynamic therapy.
# Neurosurgery Quarterly, 7, 273-285.

# data from: Zhou, X.-H., Brizendine, E. J., & Pritz, M. B. (1999). Methods
# for combining rates from several studies. Statistics in Medicine, 18,
# 557-566.

dat.pritz1997 <- read.table("data-raw/dat.pritz1997.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.pritz1997, file="data/dat.pritz1997.rda")
