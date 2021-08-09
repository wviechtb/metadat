context("Checking: dat.nielweise2008")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.nielweise2008, algo="md5"), "f7e4d793597dadf2d314545af7555d73")
})
