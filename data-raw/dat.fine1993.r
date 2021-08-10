# Fine, H. A., Dear, K. B., Loeffler, J. S., Black, P. M., & Canellos, G. P.
# (1993). Meta-analysis of radiation therapy with and without adjuvant
# chemotherapy for malignant gliomas in adults. Cancer, 71(8), 2585-2597.

# Dear, K. B. G. (1994). Iterative generalized least squares for meta-analysis
# of survival data at multiple times. Biometrics, 50(4), 989-1002.

# Trikalinos, T. A., & Olkin, I. (2012). Meta-analysis of effect sizes
# reported at multiple time points: A multivariate approach. Clinical Trials,
# 9(5), 610-620.

dat.fine1993 <- read.table("data-raw/dat.fine1993.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.fine1993, file="data/dat.fine1993.rda")
