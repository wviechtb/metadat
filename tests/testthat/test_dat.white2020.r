context("Checking: dat.white2020")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.white2020, algo="md5"), "290a7ba0476ec60c726604ec04c8d437")
})
