context("Checking: dat.spooner2002")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.spooner2002, algo="md5"), "2dfa96bd0d1515bdf370236e9da2ea76")
})
