# Assink, M., & Wibbelink, C. J. M. (2016). Fitting three-level meta-analytic
# models in R: A step-by-step tutorial. The Quantitative Methods for
# Psychology, 12(3), 154-174.

dat.assink2016 <- read.table("data-raw/dat.assink2016.txt", header=TRUE, stringsAsFactors=FALSE)

attr(dat.assink2016, "yi.names") <- "yi"
attr(dat.assink2016, "vi.names") <- "vi"
attr(dat.assink2016$yi, "measure") <- "SMD"
attr(dat.assink2016$yi, "ni") <- round((8 + c(dat.assink2016$yi)^2) / (2*dat.assink2016$vi))
class(dat.assink2016) <- c("escalc", "data.frame")
save(dat.assink2016, file="data/dat.assink2016.rda")
