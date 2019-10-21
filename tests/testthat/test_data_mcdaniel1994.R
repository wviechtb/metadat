source("hashTable.R")

context("Checking data: mcdaniel1994")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.mcdaniel1994, algo = "md5"), hashTable$mcdaniel1994)
})