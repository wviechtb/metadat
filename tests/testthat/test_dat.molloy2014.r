context("Checking: dat.molloy2014")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.molloy2014, algo="md5"), "289c001827c4d4104b2c02bd71334469")
})
