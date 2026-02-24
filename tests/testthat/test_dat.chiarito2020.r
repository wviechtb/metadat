context("Checking: dat.chiarito2020")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.chiarito2020, algo="md5"), "23e764d61226393f0f12f1b9720ee0d9")
})
