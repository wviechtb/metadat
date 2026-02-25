# Thompson, S. G., & Sharp, S. J. (1999). Explaining heterogeneity in
# meta-analysis: A comparison of methods. Statistics in Medicine, 18(20),
# 2693-2708.
# https://doi.org/10.1002/(sici)1097-0258(19991030)18:20<2693::aid-sim235>3.0.co;2-v

# originally based on:
#
# Law, M. R., Wald, N. J., & Thompson, S. G. (1994). By how much and how
# quickly does reduction in serum cholesterol concentration lower risk of
# ischaemic heart disease?. British Medical Journal, 308(6925), 367-372.
# https://doi.org/10.1136/bmj.308.6925.367
#
# but with minor modifications

dat.thompson1999 <- read.csv("data-raw/dat.thompson1999.csv")
save(dat.thompson1999, file="data/dat.thompson1999.rda")
