# Credé, M., Roch, S. G., & Kieszczynka, U. M. (2010). Class attendance in
# college: A meta-analytic review of the relationship of class attendance with
# grades and student characteristics. Review of Educational Research, 80(2),
# 272-295.

dat.crede2010 <- read.table("data-raw/dat.crede2010.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.crede2010, file="data/dat.crede2010.rda")
