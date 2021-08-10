context("Checking: dat.li2007")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.li2007, algo="md5"), "48172cc79e9a18e841fa23cb35d5b756")
})
