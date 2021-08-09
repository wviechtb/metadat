# Laopaiboon, M., Panpanich, R., & Swa Mya, K. (2015). Azithromycin for acute
# lower respiratory tract infections. Cochrane Database of Systematic Reviews,
# 3, CD001954. https://doi.org/10.1002/14651858.CD001954.pub4

dat.laopaiboon2015 <- read.table("data-raw/dat.laopaiboon2015.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.laopaiboon2015, file="data/dat.laopaiboon2015.rda")
