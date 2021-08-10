# McDaniel, M. A., Whetzel, D. L., Schmidt, F. L., & Maurer, S. D. (1994). The
# validity of employment interviews: A comprehensive review and meta-analysis.
# Journal of Applied Psychology, 79(4), 599-616.

# data from: Rothstein, H. R., Sutton, A. J., & Borenstein, M. (Eds.). (2005).
# Publication bias in meta-analysis: Prevention, assessment, and adjustments.
# Chichester, England: Wiley.

dat.mcdaniel1994 <- read.table("data-raw/dat.mcdaniel1994.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.mcdaniel1994, file="data/dat.mcdaniel1994.rda")
