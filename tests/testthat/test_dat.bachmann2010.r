context("Checking: dat.bachmann2010")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.bachmann2010, algo="md5"), "649129b0051f5eab543a5a12d3dbc21c")
})
