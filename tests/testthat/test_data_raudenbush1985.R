source("hashTable.R")

context("Checking data: raudenbush1985")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.raudenbush1985, algo = "md5"), hashTable$raudenbush1985)
})