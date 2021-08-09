context("Checking: dat.lopez2019")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.lopez2019, algo="md5"), "7c4e427c79baa8549fb3c46a1aff7265")
})
