context("Checking: dat.crede2010")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.crede2010, algo="md5"), "e41ba72533831f037300d67c501a09eb")
})
