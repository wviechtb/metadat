context("Checking: dat.anand1999")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.anand1999, algo="md5"), "83ef370cdbe1d5db37f1a3fd98676a80")
})
