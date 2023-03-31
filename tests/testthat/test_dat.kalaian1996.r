context("Checking: dat.kalaian1996")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.kalaian1996, algo="md5"), "0f15c3094fef881f444ceeeaf54771a4")
})
