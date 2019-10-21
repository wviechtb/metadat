source("hashTable.R")

context("Checking data: debruin2009")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.debruin2009, algo = "md5"), hashTable$debruin2009)
})