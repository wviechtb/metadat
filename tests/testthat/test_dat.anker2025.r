context("Checking: dat.anker2025")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.anker2025, algo="md5"), "3582c5e832d98ecbb8d50ffcbabdc580")
})
