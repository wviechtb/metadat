context("Checking: dat.tannersmith2016")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.tannersmith2016, algo="md5"), "bda45667a6c6b6e7c24c5abfc91590de")
})
