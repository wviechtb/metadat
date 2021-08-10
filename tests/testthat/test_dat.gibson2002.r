context("Checking: dat.gibson2002")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.gibson2002, algo="md5"), "5629cee5d47e75d3add44dc91ac5e4ac")
})
