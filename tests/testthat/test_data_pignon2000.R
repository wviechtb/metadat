source("hashTable.R")

context("Checking data: pignon2000")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.pignon2000, algo = "md5"), hashTable$pignon2000)
})