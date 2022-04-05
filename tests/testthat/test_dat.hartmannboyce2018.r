context("Checking: dat.hartmannboyce2018")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.hartmannboyce2018, algo="md5"), "5f8bbde96e75d8e8da450575a6b72f86")
})
