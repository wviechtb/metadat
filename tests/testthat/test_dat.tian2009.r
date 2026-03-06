context("Checking: dat.tian2009")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.tian2009, algo="md5"), "e8340aea6835e30c78e42d2c2edd35e4")
})
