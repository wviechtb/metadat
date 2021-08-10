context("Checking: dat.assink2016")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.assink2016, algo="md5"), "0ada4722449316ff2aec3621648d02b3")
})
