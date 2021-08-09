context("Checking: dat.raudenbush1985")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.raudenbush1985, algo="md5"), "61c451c67c7fc82375305c017c6f524a")
})
