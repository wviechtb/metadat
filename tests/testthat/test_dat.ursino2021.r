context("Checking: dat.ursino2021")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.ursino2021, algo="md5"), "b9c5821c858a7d8a5501822a3873c998")
})
