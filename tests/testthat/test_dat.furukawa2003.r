context("Checking: dat.furukawa2003")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.furukawa2003, algo="md5"), "e9f22be16a3dfd4832663ede1fe9d462")
})
