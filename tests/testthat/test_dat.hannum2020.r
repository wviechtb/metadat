context("Checking: dat.hannum2020")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.hannum2020, algo="md5"), "e935f7ffa13d303a2b955700f07600ad")
})
