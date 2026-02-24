context("Checking: dat.nissen2007")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.nissen2007, algo="md5"), "9039791f6c089de9dfce749cfa42c02c")
})
