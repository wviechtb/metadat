context("Checking: dat.bartos2023")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.bartos2023, algo="md5"), "fe61d69f402cb3871713264daa903621")
})
