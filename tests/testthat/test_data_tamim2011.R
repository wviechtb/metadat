source("hashTable.R")

context("Checking data: tamim2011")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.tamim2011, algo = "md5"), hashTable$tamim2011)
})