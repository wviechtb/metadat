source("hashTable.R")

context("Checking data: reed2001")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.reed2001, algo = "md5"), hashTable$reed2001)
})