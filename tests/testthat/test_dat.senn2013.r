context("Checking: dat.senn2013")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.senn2013, algo="md5"), "b845a2bc3436efff179e8c34cb99602a")
})
