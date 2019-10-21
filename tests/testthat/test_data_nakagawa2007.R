source("hashTable.R")

context("Checking data: nakagawa2007")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.nakagawa2007, algo = "md5"), hashTable$nakagawa2007)
})