context("Checking: dat.nakagawa2007")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.nakagawa2007, algo="md5"), "aef00ca12dac2cd7c27d7a8f7692ba62")
})
