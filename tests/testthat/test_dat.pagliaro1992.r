context("Checking: dat.pagliaro1992")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.pagliaro1992, algo="md5"), "7560844add63d1c6c7b44847b05da7aa")
})
