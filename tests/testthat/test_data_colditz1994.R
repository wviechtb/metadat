source("hashTable.R")

context("Checking data: colditz1994")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.colditz1994, algo = "md5"), hashTable$colditz1994)
})