context("Checking: dat.begg1989")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.begg1989, algo="md5"), "56f50ca9aa6581fd843bd1083725ccea")
})
