# Miguel, C., Tong, L., Tajika, A., Harrer, M., de Ponti, N., Yoshimura, K., 
# Ciharova, M., van Haaren, P., Buntrock, C., Cipriani, A., Salanti, G., 
# Ostinelli, E., Cristea, I. A., Cuijpers, P., Karyotaki, E., & 
# Furukawa, T. A. (2026). Psychotherapy, antidepressants, and combined 
# treatment for depression: A network meta-analysis on social functioning 
# outcomes.

dat.miguel2026 <- read.table("data-raw/dat.miguel2026.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.miguel2026, file="data/dat.miguel2026.rda")