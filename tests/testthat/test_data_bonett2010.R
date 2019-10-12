source("hashTable.R")

context("Checking data: bonett2010")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.bonett2010, algo = "md5"), hashTable$bonett2010)
})