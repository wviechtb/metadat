# de Ponti, N., Matbouriahi, M., Franco, P., Harrer, M., Miguel, C., 
# Papola, D., ... & Karyotaki, E. (2024). The efficacy of psychotherapy 
# for social anxiety disorder, a systematic review and meta-analysis. 
# Journal of Anxiety Disorders, 104, 102881. DOI: 10.1016/j.janxdis.2024.102881

dat.deponti2024 <- read.table("data-raw/dat.deponti2024.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.deponti2024, file="data/dat.deponti2024.rda")