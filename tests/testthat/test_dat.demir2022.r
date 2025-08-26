context("Checking: dat.demir2022")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.demir2022, algo="md5"), "15a5d4bb5582f06f591bfdda95ed83be")
})
