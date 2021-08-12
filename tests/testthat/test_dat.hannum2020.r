context("Checking: dat.hannum2020")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.hannum2020, algo="md5"), "b9c59303d60d42bd4d27f1035f866473")
})
