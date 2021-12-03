context("Checking: dat.baker2009")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.baker2009, algo="md5"), "80fe19afb3dca58ca7be09b65cb2de4f")
})
