context("Checking: dat.frank2008")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.frank2008, algo="md5"), "e0ac95d1768ec2fbd61dd7907434cb7e")
})
