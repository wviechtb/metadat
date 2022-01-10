context("Checking: dat.dogliotti2014")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.dogliotti2014, algo="md5"), "8dde5871843a3ed7c62c54ae84474234")
})
