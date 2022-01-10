context("Checking: dat.stowe2010")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.stowe2010, algo="md5"), "2191ce23321ec455c23daf088e09bea0")
})
