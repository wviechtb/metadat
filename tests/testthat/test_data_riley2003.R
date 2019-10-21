source("hashTable.R")

context("Checking data: riley2003")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.riley2003, algo = "md5"), hashTable$riley2003)
})