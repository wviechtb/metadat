context("Checking: dat.bakdash2021")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.bakdash2021, algo="md5"), "cb2b2109505430e49ded3586a3ba31a1")
})
