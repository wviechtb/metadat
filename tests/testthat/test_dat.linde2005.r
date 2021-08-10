context("Checking: dat.linde2005")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.linde2005, algo="md5"), "819177a7eb640f4f89b23ba11f892a5d")
})
