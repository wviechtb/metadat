# Riley, R. D., Burchill, S. A., Abrams, K. R., Heney, D., Lambert, P. C.,
# Jones, D. R., et al. (2003). A systematic review and evaluation of the use
# of tumour markers in paediatric oncology: Ewing's sarcoma and neuroblastoma.
# Health Technology Assessment, 7(5), 1-162.

# actual data from:

# Riley, R. D., Sutton, A. J., Abrams, K. R., & Lambert, P. C. (2004).
# Sensitivity analyses allowed more appropriate and reliable meta-analysis
# conclusions for multiple outcomes when missing data was present. Journal of
# Clinical Epidemiology, 57(9), 911-924.

# Riley, R. D., Abrams, K. R., Lambert, P. C., Sutton, A. J., & Thompson, J.
# R. (2007). An evaluation of bivariate random-effects meta-analysis for the
# joint synthesis of two correlated outcomes. Statistics in Medicine, 26(1),
# 78-97.

# with errata attached to second article (this is the actual data)

suppressPackageStartupMessages(library(metafor, quietly=TRUE))

dat.riley2003 <- read.table("data-raw/dat.riley2003.txt", header=TRUE, stringsAsFactors=FALSE)
dat.riley2003 <- escalc(measure="GEN", yi=yi, sei=sei, data=dat.riley2003, digits=2)
dat.riley2003 <- dat.riley2003[c(1,2,5,3,4)]
save(dat.riley2003, file="data/dat.riley2003.rda")
