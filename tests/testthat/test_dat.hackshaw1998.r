context("Checking: dat.hackshaw1998")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.hackshaw1998, algo="md5"), "40bf072f51b31ce8cfb0ca4272eddb84")
})
