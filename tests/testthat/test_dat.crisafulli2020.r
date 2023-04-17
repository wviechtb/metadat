context("Checking: dat.crisafulli2020")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.crisafulli2020, algo="md5"), "fee9264067c19c6e53294e4c72eec7ef")
})
