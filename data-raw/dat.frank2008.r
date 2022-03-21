# Frank, B., Rigas, S. H., Bermejo, J. L., Wiestler, M., Wagner, K., Hemminki, K., Reed, M. W.,
# Sutter, C., Wappenschmidt, B., Balasubramanian, S. P., Meindl, A., Kiechle, M., Bugert, P.,
# Schmutzler, R. K., Bartram, C. R., Justenhoven, C., Ko, Y.-D., Brüning, T., Brauch, H., Hamann,
# U., Pharoah, P. P. D., Dunning, A. M., Pooley, K. A., Easton, D. F., Cox, A. & Burwinkel, B.
# (2008). The CASP8 -652 6N del promoter polymorphism and breast cancer risk: A multicenter study.
# Breast Cancer Research and Treatment, 111(1), 139-144. https://doi.org/10.1007/s10549-007-9752-z

dat.frank2008 <- read.table("data-raw/dat.frank2008.txt", header=TRUE, stringsAsFactors=FALSE)
save(dat.frank2008, file="data/dat.frank2008.rda")
