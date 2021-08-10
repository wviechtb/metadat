context("Checking: dat.debruin2009")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.debruin2009, algo="md5"), "d290a731fc4232fbf2bfd54fabcf8732")
})
