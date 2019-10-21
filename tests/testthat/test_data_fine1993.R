source("hashTable.R")

context("Checking data: fine1993")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.fine1993, algo = "md5"), hashTable$fine1993)
})