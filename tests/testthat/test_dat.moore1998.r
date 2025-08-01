context("Checking: dat.moore1998")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.moore1998, algo="md5"), "a516c9fd3334ab6a16073b01497dc2fd")
})
