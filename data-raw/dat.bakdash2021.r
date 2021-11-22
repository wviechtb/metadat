# Journal article describing systematic review and meta-analysis:
# Bakdash, J. Z., Marusich, L. R., Cox, K. R., Geuss, M. N., Zaroukian,
# E. G., & Morris, K. M. (2021a). The validity of situation awareness for
# performance: A meta-analysis. Theoretical Issues in Ergonomics Science, 1–24.
# https://doi.org/10.1080/1463922X.2021.1921310

# Dataset and R Code References:
# Bakdash, J. Z., Marusich, L. R., Cox, K. R., Geuss, M. N., Zaroukian, E. G., &
# Morris, K. M. (2021b). The validity of situation awareness for performance: A
# meta-analysis (Code Ocean Capsule). https://doi.org/10.24433/CO.1682542.v4

# Bakdash, J. Z., Marusich, L. R., Cox, K. R., Geuss, M. N., Zaroukian, E. G.,
# & Morris, K. M. (2021c). The validity of situation awareness for performance: A
# meta-analysis (Systematic Review, Data, and Code).
# https://doi.org/10.17605/OSF.IO/4K7ZV

dat.bakdash2021 <- read.csv("data-raw/dat.bakdash2021.csv", header = TRUE)

# remove superfluous whitespace
dat.bakdash2021$Author    <- trimws(dat.bakdash2021$Author)
dat.bakdash2021$Title     <- trimws(dat.bakdash2021$Title)
dat.bakdash2021$DTIC.link <- trimws(dat.bakdash2021$DTIC.link)

# remove Comments variable
dat.bakdash2021$Comments <- NULL

# fix some non-ASCII strings
dat.bakdash2021$Title[187:189] <- "Operators' signal-detection performance in video display unit monitoring tasks of the main control room"
dat.bakdash2021$Title[317:318] <- "The role of driver's situational awareness on right-hook bicycle-motor vehicle crashes"

save(dat.bakdash2021, file = "data/dat.bakdash2021.rda", ascii = FALSE)
