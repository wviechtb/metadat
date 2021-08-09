context("Checking: dat.hahn2001")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.hahn2001, algo="md5"), "53da7f29fb9d9d3c73af596862c5a9a9")
})
