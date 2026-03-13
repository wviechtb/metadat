context("Checking: dat.metap")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.metap, algo="md5"), "db0d8015acbc5525a71d2f70145eadeb")
})
