context("Checking: dat.besson2016")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.besson2016, algo="md5"), "37e9119b7f262598c930291ae0fac9af")
})
