# Hart, R. G., Benavente, O., McBride, R., & Pearce, L. A. (1999).
# Antithrombotic therapy to prevent stroke in patients with atrial
# fibrillation: A meta-analysis. Annals of Internal Medicine, 131(7), 492-501.

dat.hart1999 <- read.table("data-raw/dat.hart1999.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.hart1999, file="data/dat.hart1999.rda")
