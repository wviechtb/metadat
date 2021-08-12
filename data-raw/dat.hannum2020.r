# Hannum, M. E., Ramirez, V. A., Lipson, S. J., Herriman, R. D., Toskala, A. K., Lin, C., Joseph, P.
# V., & Reed, D. R. (2020). Objective sensory testing methods reveal a higher prevalence of
# olfactory loss in COVID-19–positive patients compared to subjective methods: A systematic review
# and meta-analysis. Chemical Senses, 45(9), 865-874. https://doi.org/10.1093/chemse/bjaa064

dat.hannum2020 <- read.csv("data-raw/dat.hannum2020.csv", header=TRUE, stringsAsFactors=FALSE)
save(dat.hannum2020, file="data/dat.hannum2020.rda")
