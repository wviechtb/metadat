context("Checking: dat.landenberger2005")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.landenberger2005, algo="md5"), "787f5762af4701c33cf1ca7548e54fea")
})
