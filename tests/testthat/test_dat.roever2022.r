context("Checking: dat.roever2022")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.roever2022, algo="md5"), "1409e1999fa055ff3728478033bd5da2")
})
