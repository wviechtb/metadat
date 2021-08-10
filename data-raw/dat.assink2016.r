# Assink, M., & Wibbelink, C. J. M. (2016). Fitting three-level meta-analytic
# models in R: A step-by-step tutorial. The Quantitative Methods for
# Psychology, 12(3), 154-174.

dat.assink2016 <- read.table("data-raw/dat.assink2016.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.assink2016, file="data/dat.assink2016.rda")
