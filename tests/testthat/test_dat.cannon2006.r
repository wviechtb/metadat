context("Checking: dat.cannon2006")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.cannon2006, algo="md5"), "63a03f32e5f26afa8e0290b74d47655d")
})
