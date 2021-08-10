context("Checking: dat.knapp2017")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.knapp2017, algo="md5"), "2a2a4d239a94eaad6721a14d4cd83a37")
})
