context("Checking: dat.craft2003")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.craft2003, algo="md5"), "0e314716e890ef8c3366d01c447e8992")
})
