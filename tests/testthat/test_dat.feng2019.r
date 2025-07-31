context("Checking: dat.feng2019")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.feng2019, algo="md5"), "66f495a3b6fa0d560d5ca642c18808e2")
})
