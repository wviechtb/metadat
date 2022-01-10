context("Checking: dat.franchini2012")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.franchini2012, algo="md5"), "032fe3c5d34b4479f354fffc0dafe72f")
})
