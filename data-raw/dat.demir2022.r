# Demir, E., Öz, S., Aral, N., & Gürsoy, F. (2022). A reliability generalization
# meta-analysis of the Mother-to-Infant Bonding Scale. Psychological Reports, 127(1),
# 447-464. https://doi.org/10.1177/00332941221114413

dat.demir2022 <- read.table("data-raw/dat.demir2022.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.demir2022, file="data/dat.demir2022.rda")
