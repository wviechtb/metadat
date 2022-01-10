context("Checking: dat.dong2013")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.dong2013, algo="md5"), "e94d834a5af363dfb336bf642f790957")
})
