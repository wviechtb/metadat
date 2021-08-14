context("Checking: dat.hannum2020")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.hannum2020, algo="md5"), "5ce2207a2f8acdc2109388a116e3f45b")
})
