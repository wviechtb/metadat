context("Checking: dat.bourassa1996")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.bourassa1996, algo="md5"), "ee1fd46dc621922f30596af07ab12e31")
})
