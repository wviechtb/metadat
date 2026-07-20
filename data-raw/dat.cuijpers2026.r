# Cuijpers, P., Miguel, C., Harrer, M., Plessen, C.Y., Ciharova, M., 
# Ebert, D. & Karyotaki, E. (2026). Database of depression psychotherapy 
# trials with control conditions. Part of the Metapsy project. 
# URL docs.metapsy.org/databases/depression-psyctr. 
# DOI https://doi.org/10.5281/zenodo.7254845.

dat.cuijpers2026 <- read.table("data-raw/dat.cuijpers2026.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.cuijpers2026, file="data/dat.cuijpers2026.rda")