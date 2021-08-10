# Cannon, C. P., Steinberg, B. A., Murphy, S. A., Mega, J. L., & Braunwald, E.
# (2006). Meta-analysis of cardiovascular outcomes trials comparing intensive
# versus moderate statin therapy. Journal of the American College of
# Cardiology, 48(3), 438-445.

dat.cannon2006 <- read.table("data-raw/dat.cannon2006.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.cannon2006, file="data/dat.cannon2006.rda")
