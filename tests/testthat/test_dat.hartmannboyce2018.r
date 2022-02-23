context("Checking: dat.hartmannboyce2018")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.hartmannboyce2018, algo="md5"), "3a7edafd522bfac71aa64c7a3b57a4c9")
})
