# to also run skip_on_cran() tests, uncomment:
#Sys.setenv(NOT_CRAN="true")

library(testthat)
library(metadat)
test_check("metadat", reporter="summary")
