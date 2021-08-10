context("Checking: dat.hine1989")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.hine1989, algo="md5"), "237ad8966750f5a26cfb917b3365fcfc")
})
