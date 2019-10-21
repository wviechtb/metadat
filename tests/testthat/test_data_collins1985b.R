source("hashTable.R")

context("Checking data: collins1985b")

library(digest)


test_that("checks data md5 hash", {
  expect_match(digest(metadat::dat.collins1985b, algo = "md5"), hashTable$collins1985b)
})