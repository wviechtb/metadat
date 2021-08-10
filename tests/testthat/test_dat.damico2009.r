context("Checking: dat.damico2009")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.damico2009, algo="md5"), "4b1d4adde9227dee3b31b0e109adb938")
})
