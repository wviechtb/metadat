context("Checking: dat.assink2016")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.assink2016, algo="md5"), "4b542f0f3e66323a547b58c57d488568")
})
