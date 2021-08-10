# Bourassa, D. C., McManus, I. C., & Bryden, M. P. (1996). Handedness and
# eye-dominance: A meta-analysis of their relationship. Laterality, 1(1),
# 5-34.

dat.bourassa1996 <- read.table("data-raw/dat.bourassa1996.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.bourassa1996, file="data/dat.bourassa1996.rda")
