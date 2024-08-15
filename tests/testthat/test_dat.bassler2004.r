context("Checking: dat.bassler2004")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.bassler2004, algo="md5"), "b2602c6ffa358e30992b5de028bcc1ff")
})
