source("hashTable.R")

context("Checking data: bangertdrowns2004")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.bangertdrowns2004, algo = "md5"), hashTable$bangertdrowns2004)
})

# test_that("checks data md5 hash", {
#   expect_match(digest(metadat::dat.bangertdrowns2004, algo = "md5"), "716b3c863ecc3fd61d6a9c076732f28c")
# })