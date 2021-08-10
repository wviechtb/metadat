context("Checking: dat.obrien2003")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.obrien2003, algo="md5"), "f46831024c5e7c0ca64607327fa1987e")
})
