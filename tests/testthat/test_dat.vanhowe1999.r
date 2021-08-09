context("Checking: dat.vanhowe1999")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.vanhowe1999, algo="md5"), "3300d41b67fb79766dbb1e8fff7e50b0")
})
