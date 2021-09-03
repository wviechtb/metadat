context("Checking: dat.michael2013")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.michael2013, algo="md5"), "ff2a9079b413579d2246e0543c7f0541")
})
