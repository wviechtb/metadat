source("hashTable.R")

context("Checking data: konstantopoulos2011")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.konstantopoulos2011, algo = "md5"), hashTable$konstantopoulos2011)
})
