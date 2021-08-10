context("Checking: dat.curtis1998")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.curtis1998, algo="md5"), "a6007ef1e665877559ca0d0e0315aa4c")
})
