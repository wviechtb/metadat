context("Checking: dat.dumouchel1994")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.dumouchel1994, algo="md5"), "da9f347c3df75b8fe0c75f8e3030ad16")
})
