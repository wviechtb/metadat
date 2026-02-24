context("Checking: dat.meeker2017")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.meeker2017, algo="md5"), "4def2945d1debc973d87e6022fd11fba")
})
