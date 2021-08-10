context("Checking: dat.hart1999")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.hart1999, algo="md5"), "df7f6e390eede443380bb656e9262958")
})
