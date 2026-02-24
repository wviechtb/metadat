context("Checking: dat.karner2014")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.karner2014, algo="md5"), "f8b6f46195b565d1e87af56b320ea208")
})
