# López-López, J. A., Davies, S. R., Caldwell, D. M., Churchill, R., Peters,
# T. J., Tallon, D., Dawson, S., Wu, Q., Li, J., Taylor, A., Lewis, G.,
# Kessler, D. S., Wiles, N., & Welton, N. J. (2019). The process and delivery
# of CBT for depression in adults: A systematic review and network
# meta-analysis. Psychological Medicine, 49(12), 1937-1947.

dat.lopez2019 <- read.table("data-raw/dat.lopez2019.txt", header=TRUE, stringsAsFactors=FALSE, sep="\t")
save(dat.lopez2019, file="data/dat.lopez2019.rda")
