context("Checking: dat.maire2019")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.maire2019$dat, algo="md5"), "a1bea482e3f89fad844e08b7b3d3d987")
})

test_that("md5 hash matches for the distance matrix", {
   expect_match(digest(metadat::dat.maire2019$dmat, algo="md5"), "bc75d00397a71dc2c7a7e1c5f88f7e79")
})
