context("Checking: dat.linde2016")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.linde2016, algo="md5"), "33020cfa2aed4478bac3364b0dd3a9dd")
})
