context("Checking: dat.riley2003")

library(digest)

test_that("md5 hash matches for the data", {
   if (getRversion() >= "4.6.0") {
      expect_match(digest(metadat::dat.riley2003, algo="md5"), "33c30465073c92c11a79a4983dab4a8c")
   } else {
      expect_match(digest(metadat::dat.riley2003, algo="md5"), "606d5e3307678b0b8b57b0a833f4d184")
   }
})
