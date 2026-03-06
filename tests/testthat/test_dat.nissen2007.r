context("Checking: dat.nissen2007")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.nissen2007, algo="md5"), "b4d17e9eecf12f3a1de08c4823c25250")
})
