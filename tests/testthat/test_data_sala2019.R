source("hashTable.R")

context("Checking data: sala2019")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.sala2019, algo = "md5"), hashTable$sala2019)
})