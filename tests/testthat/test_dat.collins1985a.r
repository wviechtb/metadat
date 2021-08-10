context("Checking: dat.collins1985a")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.collins1985a, algo="md5"), "273f562fb6389816a296afd7fa89ab9c")
})
