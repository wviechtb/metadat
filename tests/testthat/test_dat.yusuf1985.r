context("Checking: dat.yusuf1985")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.yusuf1985, algo="md5"), "1204e1dd2a90ae553308cfcbe0dfb5fd")
})
