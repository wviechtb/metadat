# Niel-Weise, B. S., Stijnen, T., & van den Broek, P. J. (2007).
# Anti-infective-treated central venous catheters: A systematic review of
# randomized controlled trials. Intensive Care Medicine, 33(12), 2058-2068.

# see also: Stijnen, T., Hamza, T. H., & Ozdemir, P. (2010). Random effects
# meta-analysis of event outcome in the framework of the generalized linear
# mixed model with applications in sparse data. Statistics in Medicine,
# 29(29), 3046-3067.

dat.nielweise2007 <- read.table("data-raw/dat.nielweise2007.txt", header=TRUE, stringsAsFactors=FALSE)
dat.nielweise2007 <- dat.nielweise2007[,c(1,2,3,6,7,4,5)]
save(dat.nielweise2007, file="data/dat.nielweise2007.rda")
