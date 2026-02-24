context("Checking: dat.poole2003")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.poole2003, algo="md5"), "518d4da3e13ccb1eb60766a73ef3720f")
})
