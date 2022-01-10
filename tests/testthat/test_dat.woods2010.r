context("Checking: dat.woods2010")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.woods2010, algo="md5"), "7159dcbf42d9bc82d53959b6fd2d8b9a")
})
