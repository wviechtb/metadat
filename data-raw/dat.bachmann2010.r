# Bachmann, S., Finger, C., Huss, A., Egger, M., Stuck, A. E., & Clough-Gorr,
# K. M. (2010). Inpatient rehabilitation specifically designed for geriatric
# patients: Systematic review and meta-analysis of randomised controlled
# trials. British Medical Journal, 340, c1718.
# https://doi.org/10.1136/bmj.c1718

dat.bachmann2010 <- read.table("data-raw/dat.bachmann2010.txt", header=TRUE)
save(dat.bachmann2010, file="data/dat.bachmann2010.rda")
