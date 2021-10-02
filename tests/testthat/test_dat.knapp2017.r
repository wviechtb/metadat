context("Checking: dat.knapp2017")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.knapp2017, algo="md5"), "0d866a1328248f8c6458c5127c443e02")
})
