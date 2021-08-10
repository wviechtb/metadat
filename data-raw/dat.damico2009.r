# D'Amico, R., Pifferi, S., Torri, V., Brazzi, L., Parmelli, E., & Liberati,
# A. (2009). Antibiotic prophylaxis to reduce respiratory tract infections and
# mortality in adults receiving intensive care. Cochrane Database of
# Systematic Reviews(4).

dat.damico2009 <- read.table("data-raw/dat.damico2009.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.damico2009, file="data/dat.damico2009.rda")
