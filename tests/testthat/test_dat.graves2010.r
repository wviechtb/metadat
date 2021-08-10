context("Checking: dat.graves2010")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.graves2010, algo="md5"), "3bff074ad3ea13da4c5e67f33265709d")
})
