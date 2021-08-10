context("Checking: dat.colditz1994")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.colditz1994, algo="md5"), "a8df61024006ae1ce670b7ede5b29a9d")
})
