context("Checking: dat.hannum2020")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.hannum2020, algo="md5"), "62d64a11d98c3497f17036c41e0a7fcc")
})
