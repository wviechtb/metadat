context("Checking: dat.spooner2002")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.spooner2002, algo="md5"), "d35bdc852b7c6204236240f217046470")
})
