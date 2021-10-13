context("Checking: dat.mccurdy2020")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.mccurdy2020, algo="md5"), "f3590f669053d881ac7b32fbc378229a")
})
