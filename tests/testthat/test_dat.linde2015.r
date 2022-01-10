context("Checking: dat.linde2015")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.linde2015, algo="md5"), "003effb9075e234e4c1b7e641c85ace9")
})
