source("hashTable.R")

context("Checking data: valstad2017")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.valstad2017, algo = "md5"), hashTable$valstad2017)
})