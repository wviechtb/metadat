# Collins, R., & Langman, M. (1985). Treatment with histamine H2 antagonists
# in acute upper gastrointestinal hemorrhage. New England Journal of Medicine,
# 313(11), 660-666.

# data from: van Houwelingen, H. C., Zwinderman, K. H., & Stijnen, T. (1993).
# A bivariate approach to meta-analysis. Statistics in Medicine, 12(24),
# 2273-2284.

dat.collins1985a <- read.table("data-raw/dat.collins1985a.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.collins1985a, file="data/dat.collins1985a.rda")
