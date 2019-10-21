source("hashTable.R")

context("Checking data: lee2004")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.lee2004, algo = "md5"), hashTable$lee2004)
})