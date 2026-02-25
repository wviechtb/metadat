# Ngamaba, K. H., Panagioti, M., & Armitage, C. J. (2017). How strongly 
# related are health status and subjective well-being? Systematic review 
# and meta-analysis. The European Journal of Public Health, 27(5), 879-885.

dat.ngamaba2017 <- read.table("data-raw/dat.ngamaba2017.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.ngamaba2017, file="data/dat.ngamaba2017.rda")