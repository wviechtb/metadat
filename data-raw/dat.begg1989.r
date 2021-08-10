# Begg, C. B., Pilote, L., & McGlave, P. B. (1989). Bone marrow
# transplantation versus chemotherapy in acute non-lymphocytic leukemia: A
# meta-analytic review. European Journal of Cancer and Clinical Oncology,
# 25(11), 1519-1523.

# Begg, C. B., & Pilote, L. (1991). A model for incorporating historical
# controls into a meta-analysis. Biometrics, 47(3), 899-906.

dat.begg1989 <- read.table("data-raw/dat.begg1989.txt", header=TRUE, stringsAsFactors=FALSE)
attr(dat.begg1989, "digits") <- 4
attr(dat.begg1989, "yi.names") <- "yi"
attr(dat.begg1989, "vi.names") <- "vi"
attr(dat.begg1989$yi, "measure") <- "PR"
class(dat.begg1989) <- c("escalc", "data.frame")
save(dat.begg1989, file="data/dat.begg1989.rda")
