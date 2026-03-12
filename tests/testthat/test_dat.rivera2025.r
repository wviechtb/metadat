context("Checking: dat.rivera2025")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.rivera2025, algo="md5"), "f89914c89d7367cb8e38d3670c0e005c")
})
