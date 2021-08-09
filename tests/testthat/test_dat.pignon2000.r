context("Checking: dat.pignon2000")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.pignon2000, algo="md5"), "50b607c84d1ac4cdf03ce4cbcc7a7e20")
})
