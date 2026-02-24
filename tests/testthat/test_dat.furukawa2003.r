context("Checking: dat.furukawa2003")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.furukawa2003, algo="md5"), "a8ac8b79691f45bcab13d4f41d564427")
})
