# Tanner-Smith, E. E., Tipton, E. & Polanin, J. R. (2016). Handling complex
# meta-analytic data structures using robust variance estimates: A tutorial in
# R. Journal of Developmental and Life-Course Criminology, 2(1), 85-112.

dat.tannersmith2016 <- read.table("data-raw/dat.tannersmith2016.txt", header=TRUE, stringsAsFactors=FALSE)

save(dat.tannersmith2016, file="data/dat.tannersmith2016.rda", ascii=FALSE)
