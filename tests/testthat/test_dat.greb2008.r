context("Checking: dat.greb2008")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.greb2008, algo="md5"), "2a5cbdd2712cba02f87b4ac30b7e7a2a")
})
