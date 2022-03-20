context("Checking: dat.moura2021")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.moura2021$dat, algo="md5"), "313e588a5e1d08ee541260392beb9ae3")
})

test_that("md5 hash matches for the tree", {
   expect_match(digest(metadat::dat.moura2021$tree, algo="md5"), "78b3738727e054b2212cd16ebf1d5c6a")
})
