# Rios Moura, R., Oliveira Gonzaga, M., Silva Pinto, N., Vasconcellos-Neto,
# J., & Requena, G. S. (2021). Assortative mating in space and time: Patterns
# and biases. Ecology Letters, 24(5), 1089-1102.

# data from ~/work/meta_analysis/data/moura2021/

suppressPackageStartupMessages(library(ape, quietly=TRUE))

dat <- read.table("data-raw/dat.moura2021.txt", header=TRUE, as.is=TRUE, sep="\t")
tree <- read.tree("data-raw/dat.moura2021.tre")
dat.moura2021 <- list(dat=dat, tree=tree)
save(dat.moura2021, file="data/dat.moura2021.rda")
