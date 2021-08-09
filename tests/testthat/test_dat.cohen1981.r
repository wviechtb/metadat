context("Checking: dat.cohen1981")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.cohen1981, algo="md5"), "c74ba5b65fb0347e4842ec32276d887a")
})
