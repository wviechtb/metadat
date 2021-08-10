context("Checking: dat.kearon1998")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.kearon1998, algo="md5"), "46bb5ea53ba8d6bb22d3cceb2f8429ac")
})
