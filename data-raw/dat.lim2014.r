# Lim, J. N., Senior, A. M., & Nakagawa, S. (2014). Heterogeneity in
# individual quality and reproductive trade-offs within species. Evolution,
# 68(8), 2306-2318.

# data from ~/work/meta_analysis/data/lim2014/data_github/

suppressPackageStartupMessages(library(ape, quietly=TRUE))

dat1 <- read.table("data-raw/dat.lim2014.dat1.txt", header=TRUE, stringsAsFactors=FALSE)
dat2 <- read.table("data-raw/dat.lim2014.dat2.txt", header=TRUE, stringsAsFactors=FALSE)
dat3 <- read.table("data-raw/dat.lim2014.dat3.txt", header=TRUE, stringsAsFactors=FALSE)
dat4 <- read.table("data-raw/dat.lim2014.dat4.txt", header=TRUE, stringsAsFactors=FALSE)

tree1 <- read.tree("data-raw/dat.lim2014.tree1.tre")
tree2 <- read.tree("data-raw/dat.lim2014.tree2.tre")
tree3 <- read.tree("data-raw/dat.lim2014.tree3.tre")
tree4 <- read.tree("data-raw/dat.lim2014.tree4.tre")

dat.lim2014 <- list("m_o_size"=dat1, "m_o_fecundity"=dat2, "o_o_unadj"=dat3, "o_o_adj"=dat4,
                    "m_o_size_tree"=tree1, "m_o_fecundity_tree"=tree2, "o_o_unadj_tree"=tree3, "o_o_adj_tree"=tree4)

save(dat.lim2014, file="data/dat.lim2014.rda")
