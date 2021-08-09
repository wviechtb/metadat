context("Checking: dat.ishak2007")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.ishak2007, algo="md5"), "59501e470f16259537abc9ed864cd6f1")
})
