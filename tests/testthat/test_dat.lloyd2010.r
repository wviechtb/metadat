context("Checking: dat.lloyd2010")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.lloyd2010, algo="md5"), "fd3e2bfcf96d22f321d34180d6a8afd9")
})
