source("hashTable.R")

context("Checking data: senn2013")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.senn2013, algo = "md5"), hashTable$senn2013)
})