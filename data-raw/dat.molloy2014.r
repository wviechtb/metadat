# Molloy, G. J., O'Carroll, R. E., & Ferguson, E. (2014). Conscientiousness
# and medication adherence: A meta-analysis. Annals of Behavioral Medicine,
# 47(1), 92-101.

dat.molloy2014 <- read.table("data-raw/dat.molloy2014.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.molloy2014, file="data/dat.molloy2014.rda")
