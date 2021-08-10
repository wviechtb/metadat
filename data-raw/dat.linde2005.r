# Linde, K., Berner, M., Egger, M., & Mulrow, C. (2005). St John's wort for
# depression: Meta-analysis of randomised controlled trials. British Journal
# of Psychiatry, 186, 99-107.

dat.linde2005 <- read.table("data-raw/dat.linde2005.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.linde2005, file="data/dat.linde2005.rda")
