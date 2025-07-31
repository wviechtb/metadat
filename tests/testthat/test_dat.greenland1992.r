context("Checking: dat.greenland1992")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.greenland1992, algo="md5"), "3532a0d1256fb169c8edb191601e4b9e")
})
