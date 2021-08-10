context("Checking: dat.bangertdrowns2004")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.bangertdrowns2004, algo="md5"), "716b3c863ecc3fd61d6a9c076732f28c")
})
