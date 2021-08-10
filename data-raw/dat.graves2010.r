# Graves, P. M., Deeks, J. J., Demicheli, V., & Jefferson, T. (2010). Vaccines
# for preventing cholera: Killed whole cell or other subunit vaccines
# (injected). Cochrane Database of Systematic Reviews, 8, CD000974.
# https://doi.org/10.1002/14651858.CD000974.pub2

dat.graves2010 <- read.table("data-raw/dat.graves2010.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.graves2010, file="data/dat.graves2010.rda")
