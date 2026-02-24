context("Checking: dat.higgins2008")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.higgins2008, algo="md5"), "764827a748a675549033dc40ec2d71b0")
})
