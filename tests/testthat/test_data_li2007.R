source("hashTable.R")

context("Checking data: li2007")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.li2007, algo = "md5"), hashTable$li2007)
})