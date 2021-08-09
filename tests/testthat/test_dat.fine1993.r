context("Checking: dat.fine1993")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.fine1993, algo="md5"), "34a037b6745cf6b6e9afd6bb2aed7007")
})
