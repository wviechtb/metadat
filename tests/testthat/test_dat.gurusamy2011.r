context("Checking: dat.gurusamy2011")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.gurusamy2011, algo="md5"), "fafe3c72ffac20364548bca7a0cbe866")
})
