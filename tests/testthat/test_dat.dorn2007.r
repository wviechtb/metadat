context("Checking: dat.dorn2007")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.dorn2007, algo="md5"), "1cd82454da033a25ba5d831b1626dff5")
})
