context("Checking: dat.haeuser2009")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.haeuser2009, algo="md5"), "9645c147e2c427370561c49b39179ae1")
})
