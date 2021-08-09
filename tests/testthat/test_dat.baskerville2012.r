context("Checking: dat.baskerville2012")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.baskerville2012, algo="md5"), "fe6765cbaa93d7096aced942cdb5b32e")
})
