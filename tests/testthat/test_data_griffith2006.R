source("hashTable.R")

context("Checking data: griffith2006")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.griffith2006, algo = "md5"), hashTable$griffith2006)
})