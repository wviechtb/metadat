# Niel-Weise, B. S., Stijnen, T., & van den Broek, P. J. (2008).
# Anti-infective-treated central venous catheters for total parenteral
# nutrition or chemotherapy: A systematic review. Journal of Hospital
# Infection, 69(2), 114-123.

# see also: Stijnen, T., Hamza, T. H., & Ozdemir, P. (2010). Random effects
# meta-analysis of event outcome in the framework of the generalized linear
# mixed model with applications in sparse data. Statistics in Medicine,
# 29(29), 3046-3067.

dat.nielweise2008 <- read.table("data-raw/dat.nielweise2008.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.nielweise2008, file="data/dat.nielweise2008.rda")
