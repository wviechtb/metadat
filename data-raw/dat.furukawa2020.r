# Furukawa, T. A., Reijnders, M., Kishimoto, S., Sakata, M., 
# DeRubeis, R. J., Dimidjian, S., ... & Lespérance, F. (2020). 
# Translating the BDI and BDI-II into the HAMD and vice versa with 
# equipercentile linking. Epidemiology and Psychiatric Sciences, 29.

dat.furukawa2020 <- read.table("data-raw/dat.furukawa2020.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.furukawa2020, file="data/dat.furukawa2020.rda")