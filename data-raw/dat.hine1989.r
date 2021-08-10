# Hine, L. K., Laird, N., Hewitt, P., & Chalmers, T. C. (1989). Meta-analytic
# evidence against prophylactic use of lidocaine in acute myocardial
# infarction. Archives of Internal Medicine, 149(12), 2694-2698.

# data used in: Normand, S. T. (1999). Meta-analysis: Formulating, evaluating,
# combining, and reporting. Statistics in Medicine, 18(3), 321-359.

dat.hine1989 <- read.table("data-raw/dat.hine1989.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.hine1989, file="data/dat.hine1989.rda")
