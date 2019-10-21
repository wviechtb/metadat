source("hashTable.R")

context("Checking data: molloy2014")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.molloy2014, algo = "md5"), hashTable$molloy2014)
})