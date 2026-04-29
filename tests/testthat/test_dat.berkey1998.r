context("Checking: dat.berkey1998")

library(digest)

test_that("md5 hash matches for the data", {
   expect_match(digest(metadat::dat.berkey1998, algo="md5"), "c94bd13f07a693a3c81b44903afad980")
   expect_match(digest(metadat::dat.berkey1998r, algo="md5"), "dfd0a85e9154ccb9b14da2b17a958de7")
})
