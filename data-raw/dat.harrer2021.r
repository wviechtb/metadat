# Harrer, M., Cuijpers, P., Furukawa, T.A., & Ebert, D.D. (2021). 
# Doing Meta-Analysis with R: A Hands-On Guide (Chapter 3: Pooling Effect Sizes). 
# Boca Raton, FL and London: Chapman & Hall/CRC Press. ISBN 978-0-367-61007-4.

# Rathner, E.-M., Goosen, S., Ebert, D.D., Harrer, M., Adam, S., Küchler, A.-M.,
# Saruhanjan, K., Baumeister, H. (2018). The efficacy of third wave interventions to reduce stress among university 
# students: a meta-analysis of randomized-controlled trials. PROSPERO. 
# Available from https://www.crd.york.ac.uk/PROSPERO/view/CRD42018091683

dat.harrer2021 <- read.table("data-raw/dat.harrer2021.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.harrer2021, file="data/dat.harrer2021.rda")