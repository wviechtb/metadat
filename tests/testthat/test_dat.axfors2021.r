context("Checking: dat.axfors2021")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.axfors2021, algo="md5"), "d7f19500e14f2b8a383cefac7791f43f")
})
