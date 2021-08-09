# Lau, J., Antman, E. M., Jimenez-Silva, J., Kupelnick, B., Mosteller, F., &
# Chalmers, T. C. (1992). Cumulative meta-analysis of therapeutic trials for
# myocardial infarction. New England Journal of Medicine, 327(4), 248-254.

# but actual data from skiv.pdf, which comes from the CMA website
# https://www.meta-analysis.com/downloads/SKIV.pdf

dat.lau1992 <- read.table("data-raw/dat.lau1992.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.lau1992, file="data/dat.lau1992.rda")
