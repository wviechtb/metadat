# van Ballegooijen, W., Rawee, J., Palantza, C., Miguel, C., Harrer, M., 
# Cristea, I., ... & Cuijpers, P. (2025). Suicidal ideation and suicide 
# attempts after direct or indirect psychotherapy: a systematic review and 
# meta-analysis. JAMA psychiatry, 82(1).

dat.vanballegooijen2025 <- read.table("data-raw/dat.vanballegooijen2025.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.vanballegooijen2025, file="data/dat.vanballegooijen2025.rda")