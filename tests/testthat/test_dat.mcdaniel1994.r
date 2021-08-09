context("Checking: dat.mcdaniel1994")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.mcdaniel1994, algo="md5"), "6d9c49bc2437cd8f5cc63c38d0bc917d")
})
