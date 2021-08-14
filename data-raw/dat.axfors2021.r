# Axfors, C., Schmitt, A. M., Janiaud, P. et al. (2021). Mortality outcomes with hydroxychloroquine
# and chloroquine in COVID-19 from an international collaborative meta-analysis of randomized
# trials. Nature Communications, 12, 2349. https://doi.org/10.1038/s41467-021-22446-z

dat.axfors2021 <- read.csv("data-raw/dat.axfors2021.csv", header=TRUE, stringsAsFactors=FALSE)
save(dat.axfors2021, file="data/dat.axfors2021.rda")
