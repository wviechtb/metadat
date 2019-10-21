source("hashTable.R")

context("Checking data: hackshaw1998")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.hackshaw1998, algo = "md5"), hashTable$hackshaw1998)
})