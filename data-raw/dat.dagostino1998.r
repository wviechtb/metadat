# D'Agostino, R. B., Sr., Weintraub, M., Russell, H. K., Stepanians, M.,
# D'Agostino, R. B., Jr., Cantilena, L. R., Jr., Graumlich, J. F., Maldonado,
# S., Honig, P., & Anello, C. (1998). The effectiveness of antihistamines in
# reducing the severity of runny nose and sneezing: A meta-analysis. Clinical
# Pharmacology & Therapeutics, 64(6), 579-596.

dat.dagostino1998 <- read.table("data-raw/dat.dagostino1998.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.dagostino1998, file="data/dat.dagostino1998.rda")
