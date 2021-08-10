context("Checking: dat.laopaiboon2015")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.laopaiboon2015, algo="md5"), "1260edb7d5c69d8bc0b507f16eaacd0c")
})
