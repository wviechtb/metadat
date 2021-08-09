context("Checking: dat.lee2004")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.lee2004, algo="md5"), "3d79eee16145524fe53554e9c43109e4")
})
