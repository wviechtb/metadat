context("Checking: dat.egger2001")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.egger2001, algo="md5"), "390720b458d2f33ffa043578d6b30654")
})
