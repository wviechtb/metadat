context("Checking: dat.moura2021")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.moura2021$dat, algo="md5"), "ebcefce49e0e91e7861847aa878279ce")
})

test_that("md5 hash matches for the tree", {
   expect_match(digest(metadat::dat.moura2021$tree, algo="md5"), "78b3738727e054b2212cd16ebf1d5c6a")
})
