context("Checking: dat.nielweise2007")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.nielweise2007, algo="md5"), "05e2f281b42f16fb6be456f62b625f82")
})
