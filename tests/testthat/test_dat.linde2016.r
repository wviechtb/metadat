context("Checking: dat.linde2016")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.linde2016, algo="md5"), "5b568ccabbe79a4c4cc9faa50bf3ba8a")
})
