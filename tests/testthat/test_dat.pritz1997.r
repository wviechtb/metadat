context("Checking: dat.pritz1997")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.pritz1997, algo="md5"), "d404c9d72e033e67105c0f1bee3a20fc")
})
