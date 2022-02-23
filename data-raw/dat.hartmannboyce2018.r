# Hartmann‐Boyce, J., Chepkin, S. C., Ye, W., Bullen, C. & Lancaster, T.
# (2018). Nicotine replacement therapy versus control for smoking cessation.
# Cochrane Database of Systematic Reviews, 5.

dat.hartmannboyce2018 <- read.table("data-raw/dat.hartmannboyce2018.txt", header=TRUE, stringsAsFactors=FALSE)

save(dat.hartmannboyce2018, file="data/dat.hartmannboyce2018.rda")
