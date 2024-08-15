context("Checking: dat.curtin2002")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.curtin2002, algo="md5"), "3f6600770272aa68c2720dbfb78d0966")
})
