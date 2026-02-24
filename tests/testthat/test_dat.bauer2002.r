context("Checking: dat.bauer2002")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.bauer2002, algo="md5"), "53ff64f7716f25357ba6bb965acebc93")
})
