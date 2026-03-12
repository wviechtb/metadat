context("Checking: dat.nissen2007")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.nissen2007, algo="md5"), "8cf5635d90038997a3099c66ba205e83")
})
