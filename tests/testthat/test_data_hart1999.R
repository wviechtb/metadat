source("hashTable.R")

context("Checking data: hart1999")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.hart1999, algo = "md5"), hashTable$hart1999)
})