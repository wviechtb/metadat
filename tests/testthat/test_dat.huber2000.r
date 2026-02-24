context("Checking: dat.huber2000")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.huber2000, algo="md5"), "eb1df5e6cb1d52428512c71410175918")
})
