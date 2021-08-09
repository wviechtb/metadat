# Dorn, S. D., Kaptchuk, T. J., Park, J. B., Nguyen, L. T., Canenguez, K.,
# Nam, B. H., Woods, K. B., Conboy, L. A., Stason, W. B., & Lembo, A. J.
# (2007). A meta-analysis of the placebo response in complementary and
# alternative medicine trials of irritable bowel syndrome.
# Neurogastroenterology & Motility, 19(8), 630-637.

dat.dorn2007 <- read.table("data-raw/dat.dorn2007.txt", header=TRUE, stringsAsFactors=FALSE)
dat.dorn2007 <- dat.dorn2007[c(1:6,11,9,10,7,8)]
dat.dorn2007 <- cbind(id=1:nrow(dat.dorn2007), dat.dorn2007)
save(dat.dorn2007, file="data/dat.dorn2007.rda")
