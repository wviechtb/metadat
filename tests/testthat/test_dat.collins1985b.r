context("Checking: dat.collins1985b")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.collins1985b, algo="md5"), "a1c5ab9525f7ad9354793073bb106164")
})
