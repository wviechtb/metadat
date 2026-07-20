# Harrer, M., Adam, S. H., Messner, E. M., Baumeister, H., Cuijpers, P., 
# Bruffaerts, R., ... & Ebert, D. D. (2020). Prevention of eating disorders 
# at universities: A systematic review and meta‐analysis. International 
# Journal of Eating Disorders, 53(6).

dat.harrer2020 <- read.table("data-raw/dat.harrer2020.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.harrer2020, file="data/dat.harrer2020.rda")