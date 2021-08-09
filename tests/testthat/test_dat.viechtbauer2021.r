context("Checking: dat.viechtbauer2021")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.viechtbauer2021, algo="md5"), "2dd6203150534b3bd62dba7a329ffdf4")
})
