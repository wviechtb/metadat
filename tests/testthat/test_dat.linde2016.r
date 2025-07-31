context("Checking: dat.linde2016")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.linde2016, algo="md5"), "9fc8069e6780e60c411bbe507d490331")
})
