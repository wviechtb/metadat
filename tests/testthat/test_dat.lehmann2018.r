context("Checking: dat.lehmann2018")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.lehmann2018, algo="md5"), "bfa52ac1cf59ef847c6badf23394298f")
})
