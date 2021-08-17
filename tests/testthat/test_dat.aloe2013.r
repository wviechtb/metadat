context("Checking: dat.aloe2013")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.aloe2013, algo="md5"), "bbb5d1a536e791eba68780bb8822125a")
})
