context("Checking: dat.metap")

library(digest)

test_that("md5 hash matches for the data", {
   if (getRversion() >= "4.6.0") {
      expect_match(digest(metadat::dat.metap, algo="md5"), "33198d77ac9adf4a701bf95fb55412d0")
   } else {
      expect_match(digest(metadat::dat.metap, algo="md5"), "db0d8015acbc5525a71d2f70145eadeb")
   }
})
