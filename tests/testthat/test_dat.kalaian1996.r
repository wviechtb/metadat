context("Checking: dat.kalaian1996")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.kalaian1996, algo="md5"), "343b709bc03b99685b8a43c2d7824bc8")
})
