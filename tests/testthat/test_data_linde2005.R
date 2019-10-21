source("hashTable.R")

context("Checking data: linde2005")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.linde2005, algo = "md5"), hashTable$linde2005)
})