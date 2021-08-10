context("Checking: dat.bonett2010")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.bonett2010, algo="md5"), "ddf3b996a39cc24f594d6c2419275c99")
})
