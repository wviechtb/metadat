context("Checking: dat.bornmann2007")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.bornmann2007, algo="md5"), "cd3be7c49eed994719c0f4b224e48f24")
})
