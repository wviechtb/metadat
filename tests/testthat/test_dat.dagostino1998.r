context("Checking: dat.dagostino1998")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.dagostino1998, algo="md5"), "fa0804ed25a8d0d93f91d840a315162a")
})
