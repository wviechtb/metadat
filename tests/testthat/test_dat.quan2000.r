context("Checking: dat.quan2000")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.quan2000, algo="md5"), "f47d46448cce73409743d2e077242066")
})
