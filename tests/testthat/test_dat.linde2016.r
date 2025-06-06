context("Checking: dat.linde2016")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.linde2016, algo="md5"), "a8a664207717e267d26cbaee7bdb8b63")
})
