context("Checking: dat.konstantopoulos2011")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.konstantopoulos2011, algo="md5"), "ccc4a7cee29012013552e2dca1c634a4")
})
