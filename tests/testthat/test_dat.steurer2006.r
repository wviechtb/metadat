context("Checking: dat.steurer2006")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.steurer2006, algo="md5"), "82d05ae9bb363034b5da3a6e3e150cbc")
})
