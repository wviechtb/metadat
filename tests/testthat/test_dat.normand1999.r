context("Checking: dat.normand1999")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.normand1999, algo="md5"), "35ddafb737cfa2d73816e9d4c5c8dd76")
})
