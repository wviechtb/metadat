# Pignon, J. P., Bourhis, J., Domenge, C., & Designe, L. (2000). Chemotherapy
# added to locoregional treatment for head and neck squamous-cell carcinoma:
# Three meta-analyses of updated individual data. Lancet, 355(9208), 949-955.

# data cross-checked with:

# Michiels, S., Baujat, B., Mahé, C., Sargent, D. J., & Pignon, J. P. (2005).
# Random effects survival models gave a better understanding of heterogeneity
# in individual patient data meta-analyses. Journal of Clinical Epidemiology,
# 58(3), 238-245.

# Baujat, B., Mahé, C., Pignon, J.-P., & Hill, C. (2002). A graphical method
# for exploring heterogeneity in meta-analyses: Application to a meta-analysis
# of 65 trials. Statistics in Medicine, 21(18), 2641-2652.

dat.pignon2000 <- read.table("data-raw/dat.pignon2000.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.pignon2000, file="data/dat.pignon2000.rda")
