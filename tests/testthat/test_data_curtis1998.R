source("hashTable.R")

context("Checking data: curtis1998")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.curtis1998, algo = "md5"), hashTable$curtis1998)
})