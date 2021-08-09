context("Checking: dat.lau1992")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.lau1992, algo="md5"), "724e40152d092b1ba8793b20862fbb6a")
})
