source("hashTable.R")

context("Checking data: normand1999")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.normand1999, algo = "md5"), hashTable$normand1999)
})