context("Checking: dat.baskerville2012")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.baskerville2012, algo="md5"), "5c284797736e1def58cfbaf1ebe2a026")
})
