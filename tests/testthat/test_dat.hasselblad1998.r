context("Checking: dat.hasselblad1998")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.hasselblad1998, algo="md5"), "40a55e4cef50d2bd0430de5163d19eb0")
})
