source("hashTable.R")

context("Checking data: pagliaro1992")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.pagliaro1992, algo = "md5"), hashTable$pagliaro1992)
})