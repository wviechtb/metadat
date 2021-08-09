# Colditz, G. A., Brewer, T. F., Berkey, C. S., Wilson, M. E., Burdick, E.,
# Fineberg, H. V., et al. (1994). Efficacy of BCG vaccine in the prevention of
# tuberculosis: Meta-analysis of the published literature. Journal of the
# American Medical Association, 271(9), 698-702.

# some additional info from: van Houwelingen, H. C., Arends, L. R., & Stijnen,
# T. (2002). Advanced methods in meta-analysis: Multivariate approach and
# meta-regression. Statistics in Medicine, 21(4), 589-624.

dat.colditz1994 <- read.table("data-raw/dat.colditz1994.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.colditz1994, file="data/dat.colditz1994.rda")
