# Hahn, S., Kim, Y., & Garner, P. (2001). Reduced osmolarity oral rehydration
# solution for treating dehydration due to diarrhoea in children: Systematic
# review. British Medical Journal, 323(7304), 81-85.

dat.hahn2001 <- read.table("data-raw/dat.hahn2001.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.hahn2001, file="data/dat.hahn2001.rda")
