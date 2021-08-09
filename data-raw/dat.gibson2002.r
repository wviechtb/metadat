# Gibson, P. G., Powell, H., Wilson, A., Abramson, M. J., Haywood, P., Bauman,
# A., et al. (2002). Self-management education and regular practitioner review
# for adults with asthma. Cochrane Database of Systematic Reviews, 3.

dat.gibson2002 <- read.table("data-raw/dat.gibson2002.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.gibson2002, file="data/dat.gibson2002.rda")
