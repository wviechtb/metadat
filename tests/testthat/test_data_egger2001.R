source("hashTable.R")

context("Checking data: egger2001")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.egger2001, algo = "md5"), hashTable$egger2001)
})