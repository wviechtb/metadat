source("hashTable.R")

context("Checking data: hine1989")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.hine1989, algo = "md5"), hashTable$hine1989)
})