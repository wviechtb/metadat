context("Checking: dat.hannum2020")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.hannum2020, algo="md5"), "acd743e9130dde1860aa3538fe92e285")
})
