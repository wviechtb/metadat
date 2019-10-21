source("hashTable.R")

context("Checking data: ishak2007")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.ishak2007, algo = "md5"), hashTable$ishak2007)
})